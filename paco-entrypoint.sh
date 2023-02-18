#!/bin/bash

if [[ -z $(ls /project) ]]; then
    echo """
The 'project' volume is empty.
That means either you haven't specified which project you're about to test or your project directory is empty.
Please specify a project directory properly and run again."""
    exit
fi
cd /project
/paco/tester.sh "$@"
