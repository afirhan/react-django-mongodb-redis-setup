#!/bin/sh

# Jalankan MongoDB dengan user mongodb
exec su-exec mongodb "$@"