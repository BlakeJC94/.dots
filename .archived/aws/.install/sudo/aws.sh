curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
rm -r ./aws
rm awscliv2.zip

# TODO INSTALL AWS-SSO


curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" \
    -o "session-manager-plugin.deb"

sudo dpkg -i session-manager-plugin.deb
rm session-manager-plugin.deb
