#!/bin/bash

# Define the absolute path to your script
# Using the sf_linode mount point we verified earlier
SCRIPT_PATH="/media/sf_linode/linux-svr/assets/scripts/autodestruct.sh"
JOB="0 0 * * * $SCRIPT_PATH"
UNIQUE_LABEL="# SuperLab Storage Check"

# 1. Check if the job already exists to prevent duplicates
if crontab -l 2>/dev/null | grep -q "$UNIQUE_LABEL"; then
    echo "Cron job already exists. Skipping..."
else
    # 2. Append the unique label and the job to the current crontab
    (crontab -l 2>/dev/null; echo "$UNIQUE_LABEL"; echo "$JOB") | crontab -
    echo "Cron job installed successfully."
fi