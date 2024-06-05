#!/bin/bash

# Check if the file is executable if it's not make it executable.
make_exec() {
  # File to check and execute
  FILE=$1
  if [ ! -x "$FILE" ]; then
    echo "Making $FILE executable"
    sudo chmod +x "$FILE"
  else
    echo "$FILE is already executable"
  fi
}


# Make the script executable if its already not
# make_exec "./tls/entrypoint.sh"
# make_exec "./setup/entrypoint.sh"
# make_exec "./setup/lib.sh"
# Windows format (which uses both carriage return and newline characters for line endings)
# to Unix format (which uses only newline characters).
sed -i 's/\r$//' "./tls/entrypoint.sh"
sed -i 's/\r$//' "./setup/entrypoint.sh"
sed -i 's/\r$//' "./setup/lib.sh"

docker compose up tls

docker compose up setup

echo "Setup finished..."