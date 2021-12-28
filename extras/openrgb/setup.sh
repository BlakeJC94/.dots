To remove password requirement, use 'visudo' to edit '/etc/sudoers' and add the following line:
 
# Enable openrgb execution without password
my_username ALL = NOPASSWD: /usr/bin/openrgb
