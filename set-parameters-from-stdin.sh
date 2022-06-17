#!/bin/bash

set -eu

while read -r parameter; do
    name=$(cut -d'=' -f1 <<< "$parameter")
    value=$(grep -Eo '=.*' <<< "$parameter" | cut -c2-)

    echo "Setting $name to: '$value'..."
    aws ssm put-parameter --name="$name" --value="$value" --overwrite &&
        echo "OK" ||
        echo "FAIL"
done
