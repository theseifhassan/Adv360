#!/usr/bin/env bash
# Idempotent bootstrap for the Advantage 360 Pro ZMK config workspace.
# Initializes the west workspace (fetching the ZMK/Zephyr sources referenced by
# config/west.yml) and exports the Zephyr CMake package so `west build` works.
set -euo pipefail

cd "$(dirname "$0")/.."

if [ ! -d .west ]; then
  west init -l config
fi

west update
west zephyr-export
