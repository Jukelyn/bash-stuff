#!/bin/bash

locations_file="locations.txt"
log_dir="/home/juke/docker/scripts/logs"
log_file="$log_dir/docker_update_restart.log"

printf '%*s\n' "80" '' | tr ' ' '=' >> "$log_file"
echo "Job started at: $(date)" >> "$log_file"

# Loop through each line in the file
while IFS= read -r location
do
  # Check if the location exists
  if [ -d "$location" ]; then
    dir_name=$(basename "$location")

    echo "Navigating to $location" | tee -a "$log_file"

    echo "Processing $dir_name" | tee -a "$log_file"
    cd "$location" || exit

    echo "Running in $dir_name" | tee -a "$log_file"
#    docker compose pull > /dev/null 2>&1 && docker compose down > /dev/null 2>&1 && docker compose up -d > /dev/null 2>&1
    echo -e "Completed $dir_name\n" | tee -a "$log_file"

    cd - > /dev/null
  else
    echo "Directory $location does not exist"
  fi
done < "$locations_file"

echo "Job completed at: $(date)" >> "$log_file"

