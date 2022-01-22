if [[ "$SHELL" == "bash" ]]; then
  if [[ $(type -t orig_command_not_found_handle) == "function" && "${command_not_found_handle_backup:-}" == "1" ]]; then
    conda_suggest_alias_function command_not_found_handle orig_command_not_found_handle
    unset command_not_found_handle_backup
    unset -f orig_command_not_found_handle
  fi
  unset -f conda_suggest_alias_function
fi
