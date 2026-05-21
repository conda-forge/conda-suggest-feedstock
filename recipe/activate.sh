if [[ "$SHELL" == "bash" ]]; then
  conda_suggest_alias_function() {
    eval "${1}() $(declare -f ${2} | sed 1d)"
  }

  if [[ $(type -t command_not_found_handle) == "function" && "${command_not_found_handle_backup:-}" != "1" ]]; then
    conda_suggest_alias_function orig_command_not_found_handle command_not_found_handle
    command_not_found_handle_backup=1
  fi

  command_not_found_handle() {
    conda suggest message $1
    if [[ "${command_not_found_handle_backup:-}" == "1" ]]; then
      orig_command_not_found_handle $1
    fi
  }
fi
