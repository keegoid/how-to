
# update grub
grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg

# --------------------------  DISALLOW ROOT ACCESS

# from https://www.centos.org/docs/5/html/5.1/Deployment_Guide/s2-wstation-privileges-noroot.html
# 1.  sudo vi /etc/passwd
#     change value for root from /bin/bash to /sbin/nologin
# 2.  echo "" | sudo tee /etc/securetty
# 3.  sudo vi /etc/ssh/sshd_config
#     change: PermitRootLogin to no
#     add: AllowUsers $username

