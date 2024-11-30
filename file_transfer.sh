#!/bin/bash

# Function to display error messages with Zenity
function show_error {
    zenity --error --text="$1"
    exit 1
}

# Function to display information messages with Zenity
function show_info {
    zenity --info --text="$1"
}

# Function to log messages to a file
function log_message {
    local message="$1"
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> transfer.log
}

# Function to get checksum using md5sum or sha256sum
get_checksum() {
    local file="$1"
    local algorithm="${2:-md5sum}"
    $algorithm "$file" | awk '{ print $1 }'
}

# Function to check and install rsync if it's not already installed
check_and_install_rsync() {
    command -v rsync &>/dev/null
    if [[ $? -ne 0 ]]; then
        show_info "rsync is not installed. This script requires rsync for file copying."
        
        # Use sudo to install rsync if the user has permission
        if zenity --question --text="Would you like to install rsync?"; then
            sudo pacman -S rsync || show_error "Failed to install rsync. Please install it manually and try again."
            log_message "rsync installed successfully."
        else
            show_error "rsync is required for this script. Please install it manually."
        fi
    fi
}

# Function to check and install Zenity if it's not already installed
check_and_install_zenity() {
    command -v zenity &>/dev/null
    if [[ $? -ne 0 ]]; then
        show_info "Zenity is not installed. This script requires Zenity for GUI dialogs."
        
        # Use sudo to install Zenity if the user has permission
        if zenity --question --text="Would you like to install Zenity?"; then
            sudo pacman -S zenity || show_error "Failed to install Zenity. Please install it manually and try again."
            log_message "Zenity installed successfully."
        else
            show_error "Zenity is required for this script. Please install it manually."
        fi
    fi
}

# Check and install rsync if needed
check_and_install_rsync

# Check and install Zenity if needed
check_and_install_zenity

# Log the start of the script execution
log_message "Script execution started."

# Select files and directories to transfer
files_and_dirs=$(zenity --file-selection --multiple --directory)
if [[ -z "$files_and_dirs" ]]; then
    show_error "No files or directories selected. Exiting."
fi

# Select destination directory
destination_dir=$(zenity --file-selection --directory)
if [[ -z "$destination_dir" ]]; then
    show_error "No destination directory selected. Exiting."
fi

log_message "Selected files and directories: $files_and_dirs"
log_message "Destination directory: $destination_dir"

# Start the file transfer using rsync
rsync -avh --progress "$files_and_dirs" "$destination_dir" || show_error "Failed to transfer files. Please check the error messages."

log_message "File transfer completed successfully."

# Ask if the user wants to verify file integrity
if zenity --question --text="Would you like to verify the file integrity?"; then
    zenity --info --text="Starting file integrity verification..."

    # Collect all files to verify
    declare -a files_to_verify=()
    while IFS= read -r -d '' file; do
        if [[ -f "$file" ]]; then
            files_to_verify+=("$file")
        fi
    done < <(find $files_and_dirs -type f -print0)

    log_message "Found ${#files_to_verify[@]} files to verify."

    # Verify each file
    for original_file in "${files_to_verify[@]}"; do
        relative_path="${original_file#$destination_dir}"
        transferred_file="$destination_dir$relative_path"

        if [[ ! -f "$transferred_file" ]]; then
            log_message "Warning: Transferred file '$transferred_file' does not exist."
            continue
        fi

        original_checksum=$(get_checksum "$original_file")
        transferred_checksum=$(get_checksum "$transferred_file")

        if [[ "$original_checksum" == "$transferred_checksum" ]]; then
            log_message "Checksum match for '$relative_path'."
        else
            log_message "Error: Checksum mismatch for '$relative_path'. Original: $original_checksum, Transferred: $transferred_checksum."
            show_error "Integrity verification failed for '$relative_path'. Checksums do not match."
        fi
    done

    zenity --info --text="File integrity verification completed successfully."
    log_message "File integrity verification completed."
fi

log_message "Script execution finished."

# Display a final success message to the user
show_info "The file transfer and integrity verification (if selected) have been completed successfully. Please check transfer.log for details."
