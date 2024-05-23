#!/usr/bin/env bash

# No need for apt-get commands as the filesystem is read-only
# Ensure using pre-built wheels for Python packages
pip install -r requirements.txt
