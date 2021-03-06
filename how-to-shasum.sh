#!/bin/sh

# generate shasum for a file
sha512sum logclean.sh > SHA512SUMS

# verify shasum for a file
sha512sum -c SHA512SUMS