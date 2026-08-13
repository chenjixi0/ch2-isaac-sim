#!/usr/bin/env bash

echo "========================================"
echo " Isaac Sim Environment Check"
echo "========================================"
echo

echo "[1/3] Ubuntu version"
if command -v lsb_release >/dev/null 2>&1; then
    lsb_release -a 2>/dev/null
else
    cat /etc/os-release
fi

echo
echo "[2/3] System architecture"
uname -m

echo
echo "[3/3] NVIDIA GPU and driver"
if command -v nvidia-smi >/dev/null 2>&1; then
    nvidia-smi
else
    echo "nvidia-smi not found."
    echo "Please check whether the NVIDIA driver is installed correctly."
fi

echo
echo "========================================"
echo " Check finished"
echo "========================================"
