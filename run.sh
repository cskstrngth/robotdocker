#!/bin/sh
set -e

# Set the defaults
# Available levels: TRACE, DEBUG, INFO (default), WARN, NONE (no logging)
DEFAULT_LOG_LEVEL="INFO"
DEFAULT_ROBOT_TESTS="false"

# Use default if none specified as env var
LOG_LEVEL=${LOG_LEVEL:-$DEFAULT_LOG_LEVEL}
ROBOT_TESTS=${ROBOT_TESTS:-$DEFAULT_ROBOT_TESTS}

if [[ "${ROBOT_TESTS}" == "false" ]]; then
  echo "Error: Please specify the robot test or directory as env var ROBOT_TESTS"
  exit 1
fi

# Execute tests
echo -e "Executing robot tests at log level ${LOG_LEVEL}"

robot --loglevel ${LOG_LEVEL} --outputdir ${ROBOT_TESTS} ${ROBOT_TESTS}

