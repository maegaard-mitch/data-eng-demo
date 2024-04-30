#!/bin/bash

# clean existing venv
poetry env remove --all

# Create a virtual environment using Python 3.10
poetry env use python3.10

# Install dependencies from the lock file
poetry install

poetry run pre-commit install
