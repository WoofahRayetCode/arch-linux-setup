#!/bin/bash
set -e

sudo mount.cifs //192.168.0.183/Public /home/ericparsley/WDMyCloudNAS -o username=ericparsley,uid=1000,gid=1000,vers=2.0
