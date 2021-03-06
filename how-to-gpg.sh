#!/bin/sh

# personal gpg key
# 17692138D44F2A81980F30D60D8F7627F4E5B8C0

# professional gpg key
# E67BC11CD9B3EC3B81B70C3568BFEBFB3C1B8D5A

# export your public key for others to import, stripping out other signatures
gpg --export --export-options export-minimal -a E67BC11CD9B3EC3B81B70C3568BFEBFB3C1B8D5A > kmullaney.asc

# sign a file with detached signature in ASCII format
gpg --detach-sign -ao SHA512SUMS.gpg SHA512SUMS

# verify a file with detached sig
gpg --verify SHA512SUMS.gpg SHA512SUMS

# renew keys
gpg --edit-key E67BC11CD9B3EC3B81B70C3568BFEBFB3C1B8D5A
expire
key 1
key 2
expire
save

# copy to MIT server
gpg --keyserver pgp.mit.edu --send-keys E67BC11CD9B3EC3B81B70C3568BFEBFB3C1B8D5A
gpg --keyserver keyserver.ubuntu.com --send-keys E67BC11CD9B3EC3B81B70C3568BFEBFB3C1B8D5A

# copy .gnupg to each computer