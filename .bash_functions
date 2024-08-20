# Extract and convert the project name to lowercase
get_project_name() {
  basename "$PWD" | tr '[:upper:]' '[:lower:]'
}

dps_count() {
  # Use correct syntax for command substitution and filtering
  docker ps --filter "label=com.docker.compose.project=$(get_project_name)" --format "{{.ID}}" | wc -l
}

dps_msg() {
  # Use correct syntax for command substitution and escaping quotes
  printf "Showing only %s's containers (%d)\n\n" "$(get_project_name)" "$(dps_count)"
}

dps() {
  # Use correct syntax for command substitution and escaping quotes
  dps_msg
  docker ps --filter "label=com.docker.compose.project=$(get_project_name)" --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}"
}

dpsa() {
  # Correctly count all containers and display them
  printf "Showing all %d containers:\n\n" "$(docker ps -q | wc -l)"
  docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}"
}