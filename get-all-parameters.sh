#!/bin/bash

set -eu

aws ssm describe-parameters --query "Parameters[*].{Name:Name}" |
    jq --raw-output '.[].Name' |
    sort |
    while read -r name; do
        value=$(
            aws ssm get-parameter --name="$name" --with-decryption |
                jq --raw-output '.Parameter.Value'
        )

        echo "$name=$value"
    done
