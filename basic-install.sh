#!/bin/bash
border()
{
    title="| $1 |"
    edge=$(echo "$title" | sed 's/./-/g')
    echo "$edge"
    echo "$title"
    echo "$edge"
}

border "Downloading Sound File"

sleep 5
wget https://github.com/dynobot/Linux-Audio-Adjustments/raw/master/Sound.sh
mv Sound.sh /usr/bin/Sound.sh
chmod 755 /usr/bin/Sound.sh
sleep 5

border()
{
    title="| $1 |"
    edge=$(echo "$title" | sed 's/./-/g')
    echo "$edge"
    echo "$title"
    echo "$edge"
}

border "Increasing Sound Group Priority"
sleep 4
mv /etc/security/limits.conf /etc/security/limits.conf.bak
echo "#New Limits" > /etc/security/limits.conf
echo '@audio - rtprio 99' >> /etc/security/limits.conf
echo '@audio - memlock 512000' >> /etc/security/limits.conf
echo '@audio - nice -20' >> /etc/security/limits.conf
sleep 5

border()
{
    title="| $1 |"
    edge=$(echo "$title" | sed 's/./-/g')
    echo "$edge"
    echo "$title"
    echo "$edge"
}

border "Improving Network Latency"


mv /etc/sysctl.conf /etc/sysctl.conf.bak
echo "#New Network Latency" > /etc/sysctl.conf
echo 'net.core.rmem_max = 16777216' >> /etc/sysctl.conf
echo 'net.core.wmem_max = 16777216' >> /etc/sysctl.conf
sleep 5

border()
{
    title="| $1 |"
    edge=$(echo "$title" | sed 's/./-/g')
    echo "$edge"
    echo "$title"
    echo "$edge"
}

border "Creating System Service"


sleep 4
#mv /etc/rc.local /etc/rc.local.bak
sed -i -e '$i \/usr/bin/Sound.sh\n' /etc/rc.local

sleep 5
border()
{
    title="| $1 |"
    edge=$(echo "$title" | sed 's/./-/g')
    echo "$edge"
    echo "$title"
    echo "$edge"
}

border "Rebooting System"
reboot