#!/usr/bin/env bash

DEFAULT_ISAAC_DIR="$HOME/isaac-sim-standalone-5.0.0-linux-x86_64"
ISAAC_DIR="${1:-$DEFAULT_ISAAC_DIR}"

echo "Isaac Sim directory:"
echo "$ISAAC_DIR"
echo

if [ ! -d "$ISAAC_DIR" ]; then
    echo "Error: Isaac Sim directory does not exist."
    echo "Default directory:"
    echo "$DEFAULT_ISAAC_DIR"
    echo
    echo "If your installation directory is different, run:"
    echo "./launch_isaac_sim.sh /path/to/isaac-sim"
    exit 1
fi

SELECTOR="$ISAAC_DIR/isaac-sim.selector.sh"

if [ ! -f "$SELECTOR" ]; then
    echo "Error: isaac-sim.selector.sh was not found."
    echo "Please confirm that Isaac Sim 5.0.0 has been extracted completely."
    exit 1
fi

cd "$ISAAC_DIR" || exit 1

if [ ! -x "./isaac-sim.selector.sh" ]; then
    echo "isaac-sim.selector.sh is not executable."
    echo "Adding execute permission..."
    chmod +x ./isaac-sim.selector.sh
fi

echo "Starting Isaac Sim Application Selector..."
./isaac-sim.selector.sh
