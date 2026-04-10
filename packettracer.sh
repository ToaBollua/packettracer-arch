#!/bin/bash

# Launcher script for Cisco Packet Tracer

export PTDIR=/opt/pt
export LD_LIBRARY_PATH="${PTDIR}/bin"

if [ -x "${PTDIR}/bin/PacketTracer" ]; then
    exec "${PTDIR}/bin/PacketTracer" "$@"
else
    # Fallback to look for older version executables (e.g. PacketTracer7)
    EXEC=$(find "${PTDIR}/bin" -name 'PacketTracer*' -executable -type f | head -n 1)
    if [ -n "$EXEC" ]; then
        exec "$EXEC" "$@"
    else
        echo "Error: PacketTracer executable not found in ${PTDIR}/bin" >&2
    fi
fi
