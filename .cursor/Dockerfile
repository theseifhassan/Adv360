# Cloud Agent base image for building the Advantage 360 Pro ZMK firmware.
# Reuses the same toolchain image the GitHub Actions CI builds with, so it ships
# the Zephyr SDK (/opt/zephyr-sdk-*), west, cmake and ninja out of the box.
FROM docker.io/zmkfirmware/zmk-build-arm:stable

# The upstream image runs as root and ships no non-root user, but Cursor Cloud
# Agents expect an `ubuntu` user with passwordless sudo. Create it here.
# The Zephyr SDK lives under /opt, which Zephyr's CMake toolchain discovery
# searches by default, so it stays usable for the non-root user.
RUN apt-get update \
    && apt-get install -y --no-install-recommends sudo \
    && rm -rf /var/lib/apt/lists/* \
    && (id -u ubuntu >/dev/null 2>&1 || useradd -m -s /bin/bash ubuntu) \
    && usermod -aG sudo ubuntu \
    && printf 'ubuntu ALL=(ALL) NOPASSWD:ALL\n' > /etc/sudoers.d/ubuntu \
    && chmod 0440 /etc/sudoers.d/ubuntu
