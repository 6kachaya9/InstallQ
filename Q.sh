sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable
sudo apt install qbittorrent-nox -y
sudo adduser --system --group qbittorrent-nox
sudo adduser kachaya qbittorrent-nox
cd /etc/systemd/system
echo '[Unit]' > qbittorrent-nox.service
echo 'Description=qBittorrent Command Line Client' >> qbittorrent-nox.service
echo 'After=network.target' >> qbittorrent-nox.service
echo '[Service]' >> qbittorrent-nox.service
echo '#Do not change to "simple"' >> qbittorrent-nox.service
echo 'Type=forking' >> qbittorrent-nox.service
echo 'User=qbittorrent-nox' >> qbittorrent-nox.service
echo 'Group=qbittorrent-nox' >> qbittorrent-nox.service
echo 'UMask=007' >> qbittorrent-nox.service
echo 'ExecStart=/usr/bin/qbittorrent-nox -d --webui-port=8080' >> qbittorrent-nox.service
echo 'Restart=on-failure' >> qbittorrent-nox.service
echo '[Install]' >> qbittorrent-nox.service
echo 'WantedBy=multi-user.target' >> qbittorrent-nox.service
sudo systemctl start qbittorrent-nox
sudo systemctl daemon-reload
sudo systemctl enable qbittorrent-nox
systemctl status qbittorrent-nox
sudo ufw allow 8080
