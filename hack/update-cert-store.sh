#!/usr/bin/env bash

SCRIPT_LOCATION=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
SCRIPT_NAME=update-cert-store
WINDOWS_SCRIPT_PATH="$(wslpath -w ${SCRIPT_LOCATION})\\${SCRIPT_NAME}.ps1"

powershell.exe Start-Process -FilePath "powershell" -Verb runAs -Wait -ArgumentList "'"-ExecutionPolicy ByPass"'","'"-File ${WINDOWS_SCRIPT_PATH}"'"

# Add linux and macos
