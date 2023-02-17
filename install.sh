#!/bin/bash

# Arrange filesystem layout
cd /paco

if ! python3 -m venv venv ; then
    echo "Unknown error while generating the virtual envionment"
    exit 1
fi

. venv/bin/activate
pip install wheel norminette
pip install -r requirements.txt
