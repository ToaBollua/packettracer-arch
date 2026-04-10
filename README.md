# Cisco Packet Tracer - Arch Linux PKGBUILD

This is a standalone, professional PKGBUILD for Cisco Packet Tracer on Arch Linux.
It packages the official Ubuntu `.deb` package to run natively on Arch Linux.

## Requirements

You must download the official `CiscoPacketTracer_8.2.2_Ubuntu_64bit.deb` file (or the version corresponding to the `pkgver` in the PKGBUILD) from the [Cisco Networking Academy](https://www.netacad.com/resources/lab-downloads) and place it in the same directory as this `PKGBUILD`.

## Building and Installing

1. Clone or download this repository.
2. Ensure the downloaded `.deb` file is in the same directory.
3. Run `makepkg -si` to build and install the package.

## Features

- Uses the official Cisco provided Debian package.
- Correctly sets up desktop entries, icons, and MIME types.
- Provides a robust launcher script (`/usr/bin/packettracer` and symlinked to `/usr/bin/pt`) that sets `LD_LIBRARY_PATH` properly.
- Handles standard Arch Linux permissions and ownership.
- Ensures required dependencies are specified.
