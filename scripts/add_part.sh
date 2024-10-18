#!/bin/bash

REPO_DIR=`git rev-parse --show-toplevel`

if [ ! -d "$REPO_DIR/.venv" ]; then
    echo "Creating python environment"
    python -m venv $REPO_DIR/.venv
    source $REPO_DIR/.venv/bin/activate
    pip install -r $REPO_DIR/requirements.txt
fi

if [ ! $# -eq 1 ]; then
    echo -e "Usage is\n  add_part.sh  CXXXX\nwhere CXXXX is the LCSC part number"
    #exit()
fi

mkdir -p $REPO_DIR/libs/EasyEDA
easyeda2kicad --full --lcsc_id=$1 --output $REPO_DIR/libs/EasyEDA
