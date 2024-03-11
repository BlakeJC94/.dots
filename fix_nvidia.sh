sudo systemctl stop nvidia-suspend.service
sudo systemctl stop nvidia-hibernate.service
sudo systemctl stop nvidia-resume.service

sudo systemctl disable nvidia-suspend.service
sudo systemctl disable nvidia-hibernate.service
sudo systemctl disable nvidia-resume.service

sudo mv /lib/systemd/system-sleep/nvidia ~/nvidia.bak

# https://askubuntu.com/a/1391917
