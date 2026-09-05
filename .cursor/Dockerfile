# Cloud Agent base image for building the Advantage 360 Pro ZMK firmware.
# Reuses the same toolchain image the GitHub Actions CI builds with, so it ships
# the Zephyr SDK (arm-zephyr-eabi), west, cmake and ninja out of the box.
FROM docker.io/zmkfirmware/zmk-build-arm:stable

# The nanopb generator (pulled in by zmk-studio) imports pkg_resources, which was
# removed in setuptools 81+. Pin below that so `west build` succeeds.
RUN pip3 install --no-cache-dir "setuptools<81"
