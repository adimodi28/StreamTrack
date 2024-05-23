#!/usr/bin/env bash

# Ensure using pre-built wheels for Python packages
pip install --no-cache-dir --only-binary :all: -r requirements.txt
