#!/bin/bash

# reuse argument from last command in current command
mkdir testdir
cd $_

# grep and output the whole file with matches, ignore case, with numbered lines
grep -Ein '^|match1|match2|match3' file

# this redirects stdout to file.log and then redirects stderr to stdout. Both will end up in file.log
node index.js >file.log 2>&1

# this redirects stderr to stdout and then redirects stdout to file.log. So stderr will go to the console and stdout will go to file.log
node index.js 2>&1 >file.log

# print set
shopt -p

# print set options
shopt -po

# save tracestate
shopt -s inherit_errexit; shopt -po; shopt -p

# fix ctrl+d by turning ignoreeof on and back off
set -o ignoreeof
set +o ignoreeof

# 1. Assign multi-line string to a shell variable
$ sql=$(cat <<EOF
SELECT foo, bar FROM db
WHERE foo='baz'
EOF
)

# 2. Pass multi-line string to a file in Bash
cat <<EOF > print.sh
#!/bin/bash
echo \$PWD
echo $PWD
EOF

# 3. Pass multi-line string to a pipe in Bash
cat <<EOF | grep 'b' | tee b.txt
foo
bar
baz
EOF

# 4. Keep indentation
cat <<-EOF
  foo
  bar
  baz
EOF

# 5. Prevent variable expansion
cat <<-'EOF'
  $foo
  $bar
  $baz
EOF

# set variable used in script and run script with nohup
# nohup (no hangup) so it will keep running after logging out
# end command with & to keep it running in background
FLASK_APP=/opt/app.py
nohup flask run --host=0.0.0.0 &

# save text from URL to file
curl -s [URL] > file.txt

# save text from URL to file in root system
curl -s [URL] | sudo tee file.txt

# list most used shell commands
history | awk '{print $2}' | sort | uniq -c | sort -rn | head -15

# dig
dig angryadriana.jkojko.com A @1.1.1.1 +noall +answer

# remove ssh host
ssh-keygen -f "/home/user/.ssh/known_hosts" -R "172.17.0.2"
ssh-keygen -f "/home/user/.ssh/known_hosts" -R "[miner1]:999"

# backup a directory and display progress
rsync -aP --stats --del source/ destination

# dry run
rsync -anP --stats --del source/ destination

# connect to wifi using nmcli (Network Manager Command Line Interface)
nmcli d
nmcli r wifi on
nmcli d wifi list
sudo nmcli d wifi connect my_wifi password <password>

# tell ethernet adapter to connect
nmcli d connect enp0s25

# show library files for a package like ssh
ldd "$(which ssh)"

# all listening ports, type of protocol, port number, and pID/program name
netstat -nap | grep [port|name]

# nmap scan all open ports on network
nmap -T5 192.168.1.0/24

# ripgrep find text in files of type md show counts
rg -tmd -c libkm

# get UUID for partition
sudo blkid /dev/sda1

# scan network devices
ifconfig
sudo arp-scan --interface=enp0s25 --localnet

# get hard drive details
sudo hdparm -I /dev/sda | less

# umask options
# Octal value : Permission
# 0 : read, write and execute
# 1 : read and write
# 2 : read and execute
# 3 : read only
# 4 : write and execute
# 5 : write only
# 6 : execute only
# 7 : no permissions

# umask, fmask, and dmask masks
    0   1   2   3   4   5   6   7
r   +   +   +   +   -   -   -   -
w   +   +   -   -   +   +   -   -
x   +   -   +   -   +   -   +   -

# this method is much faster
find . -type d -print0 | xargs -0 chmod 0755
find . -type f -print0 | xargs -0 chmod 0644

# use this to make files executable within a directory (.virtualenv for example)
find .virtualenv -type f -print0 | xargs -0 chmod 0744

# set permissions to 755 for all directories
find /path/to/directory -type d -exec chmod 755 {} \;

# set permissions to 644 for all files
find /path/to/directory -type f -exec chmod 644 {} \;

# set execute permissions on all files of a certain type starting in the current directory
find . -type f -name '*.sh' -exec chmod +x {} \;

# globbing
# include files that start with n-h
ll [n-s]*

# exclude files that start with n-h
ll [^n-s]*

# assign array of inputs
str=( "$*" )

# concatenate inputs and assign to variable
str=$*

# assign the last two inputs
str=${*: -2}
echo "$str"

# copy everything in a directory, including hidden files to current directory
cp -r folder/. .

# list only hidden files
ls -a | grep "^\."
ls -a | grep "^[.]"

# change file and directory names
for d in * ; do mv "${d}" "${d}9" ; done

# another example of renaming files using parameter substitution
# changes file name Keegan xyz to Keegan_xyz
for d in * ; do mv "$d" "${d%% *}_${d##*Keegan }" ; done

# another example
# finds anything_.jpg and renames to anything.jpg
for d in *_.jpg ; do mv "$d" "${d%_*}.jpg" ; done

# replace something like an underscore in a bunch of file names recursively
find . -type f -name '*_*' | while read FILE ; do newfile="$(echo ${FILE} | sed -e 's/_/ /g')" ; mv "${FILE}" "${newfile}" ; done

# add group to user
sudo usermod -a -G groupName userName

# regex to match whole word
^123456$

# rename folder and files in current directory to lowercase
rename -v 'y/A-Z/a-z/' *

# send file contents to gist and copy resulting url
cat somefile | gist -c -f bash_aliases -t sh -d "bash aliases"

# find files and directories
find ~/ -type f -name "file.txt"
find ~/ -type d -name "directory"
sudo find / -type f -name "file.txt"
sudo find / -type d -name "directory"

# width of variable in spaces
var=xyz
echo "${#var}"
3

# Premise: It's better to check if a package doesn't exist.

# 1. If we check that a package exists and get a false positive, that package will never get installed.
# 1. If we check that a package doesn't exist and get a false positive, apt-get will attempt to install it and notice that it is already installed.

# So it is better to check that a package doesn't exist because a false positive here does no harm.

# cat into file or pip
cat <<EOF | lxc profile edit bridgeprofile
> description: Bridged networking LXD profile
> devices:
>   eth0:
>     name: eth0
>     nictype: bridged
>     parent: lxd0
>     type: nic
> EOF
