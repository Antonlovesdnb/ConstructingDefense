apt-get -y install auditd
sleep 10
rm /etc/audit/rules.d/audit.rules
sleep 1
wget --no-check-certificate https://github.com/Antonlovesdnb/ConstructingDefense/raw/main/audit.rules -O /etc/audit/rules.d/audit.rules
sleep 5
systemctl restart auditd.service
wget --no-check-certificate https://github.com/threathunters-io/laurel/releases/download/v0.6.2/laurel-v0.6.2-x86_64-glibc.tar.gz
sleep 5
tar xzf laurel-v0.6.2-x86_64-glibc.tar.gz
sleep 5
install -m755 laurel /usr/local/sbin/laurel
sleep 5
useradd --system --home-dir /var/log/laurel --create-home _laurel
mkdir /etc/laurel
wget --no-check-certificate https://github.com/Antonlovesdnb/ConstructingDefense/raw/main/config.toml -O /etc/laurel/config.toml
sleep 5
wget --no-check-certificate https://raw.githubusercontent.com/threathunters-io/laurel/master/etc/audit/plugins.d/laurel.conf -O /etc/audit/plugins.d/laurel.conf
sleep 5
sudo pkill -HUP auditd
