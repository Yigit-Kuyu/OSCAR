#!/bin/bash

# OSCAR Project Setup Script
# This script sets up the environment and installs dependencies

echo "Setting up OSCAR Project Environment..."


if ! command -v python3 &> /dev/null; then
    echo "Python3 is not installed. Please install Python3 first."
    exit 1
fi


if ! command -v pip3 &> /dev/null; then
    echo "pip3 is not installed. Please install pip3 first."
    exit 1
fi

# Create virtual environment (optional but recommended)
read -p "Do you want to create a virtual environment? (y/n): " create_venv
if [[ $create_venv == "y" || $create_venv == "Y" ]]; then
    echo "Creating virtual environment..."
    python3 -m venv oscar_v
    source oscar_v/bin/activate
    echo "Virtual environment activated."
fi


echo "Installing dependencies from requirements.txt..."
pip install -r requirements.txt

echo "Setup completed!"
echo ""
echo "Usage:"
echo "  For OSCAR training: ./run/train_oscar.sh"
echo "  For OSCAR testing:  ./run/test_oscar.sh"
echo "  For ResNet training: ./run/train_resnet.sh"
echo "  For ResNet testing:  ./run/test_resnet.sh"
echo ""
echo "Note: Make sure to update config/config.yaml with your specific paths and settings."
