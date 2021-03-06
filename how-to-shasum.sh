#!/bin/sh

# generate shasum for a file
sha512sum logclean.sh > SHA512SUMS

# verify shasum for a file
sha512sum -c SHA512SUMS

# verify ledger AppImage
sha512sum ledger-live-desktop-2.23.0-linux-x86_64.AppImage | cut -d' ' -f1 | xxd -r -p | base64 -w 0 | grep $(cat latest-linux.yml | grep -E ^\(sha512\) | cut -d' ' -f2) && echo valid || echo invalid