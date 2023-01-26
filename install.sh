#!/bin/bash

# arrange francinette inside container
cd /paco

mv tester.sh paco

if ! python3 -m venv venv ; then
    echo "Unknown error while generating the virtual envionment"
    exit 1
fi

. venv/bin/activate
pip install wheel
pip install -r requirements.txt
