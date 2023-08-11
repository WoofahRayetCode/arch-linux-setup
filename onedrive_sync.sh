#!/bin/bash
set -e

cd
mkdir OneDrive
cd OneDrive

onedrive --syncdir /home/ericparsley/Storage/OneDrive --synchronize --force
