#! /bin/bash
## A Shell script using one key to deploy KMS Server service on Linux.
## Author: Tony Chang <tonychang7869@gmail.com>
## GitHub Repo: https://github.com/tony-aptx4869/one-key-kms

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
DISTRO='unknown'
PM='unknown'
clear

get_dist_and_pm() {
  if grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
    DISTRO='RHEL'
    PM='yum'
  elif grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
    DISTRO='CentOS'
    PM='yum'
  elif grep -Eqi "Rocky" /etc/issue || grep -Eq "Rocky" /etc/*-release; then
    DISTRO='Rocky'
    PM='yum'
  elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
    DISTRO='Fedora'
    PM='yum'
  elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
    DISTRO='Aliyun'
    PM='yum'
  elif grep -Eqi "TencentOS" /etc/issue || grep -Eq "TencentOS" /etc/*-release; then
    DISTRO='TencentOS'
    PM='yum'
  elif grep -Eqi "OpenCloudOS" /etc/issue || grep -Eq "OpenCloudOS" /etc/*-release; then
    DISTRO='OpenCloudOS'
    PM='yum'
  elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
    DISTRO='Debian'
    PM='apt'
  elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
    DISTRO='Ubuntu'
    PM='apt'
  elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
    DISTRO='Raspbian'
    PM='apt'
  elif grep -Eqi "Mint" /etc/issue || grep -Eq "Mint" /etc/*-release; then
    DISTRO='Mint'
    PM='apt'
  fi
}

exit_when_distro_or_pm_unknown() {
  echo -e "\033[41;37mSorry!\033[0m"
  echo -e "\033[41;37mYour Linux Distro or Package Manager is UNKOWN.\033[0m"
  echo -e "\033[46;30mThis script cannot be running on this Operating System.\033[0m"
  echo -e "\033[46;30mIt's recommended to use CentOS, Rocky or Ubuntu.\033[0m"
  echo -e "\033[46;30mGoodbye! Are you OK?\033[0m"
  echo -e "\033[46;30mTony Chang <tonychang7869@gmail.com>\033[0m"
  echo ""
  exit 404
}

start() {
  PWD_DIR=$(pwd)
  CLONE_DIR="vlmcsd_one_key"
  GITHUB_REPO="https://github.com/Wind4/vlmcsd.git"
  service kms stop
  systemctl disable kms.service
  if [ $PM == 'apt' ]; then
    apt update
    apt -y install python3-dev gcc git make
  elif [ $PM == 'yum' ]; then
    yum -y install gcc git make
  else
    exit_when_distro_or_pm_unknown
  fi
  mkdir /usr/local/kms
  cd $PWD_DIR
  curl -s -o /tmp/df21e05ee251a0 --connect-timeout 1 -m 1 -u df21e05ee251a0: ipinfo.io
  if grep -Eqi "\"country\":\ \"CN\"" /tmp/df21e05ee251a0; then
    GITHUB_REPO="https://ghproxy.com/https://github.com/Wind4/vlmcsd.git"
    echo ""
    echo -e "\033[41;33mYou are in Mainland, China! Using proxy to git clone.\033[0m"
    echo ""
  fi
  echo "git clone" $GITHUB_REPO
  git clone $GITHUB_REPO $CLONE_DIR
  cd $CLONE_DIR
  git checkout "$(git tag --sort=v:refname | tail -n1)"
  sed -i 's/built\\\ /built\\\ by\\\ Tony\\\ Chang\,\\\ /g' src/GNUmakefile
  make
  cp ./bin/vlmcsd /usr/local/kms/vlmcsd
  cp ./bin/vlmcs /usr/local/kms/vlmcs
  chmod +x /usr/local/kms/vlmcsd
  chmod +x /usr/local/kms/vlmcs
  cd $PWD_DIR
  echo "[Unit]
Description=KMS Server (vlmcsd built by Tony Chang)
After=network.target

[Service]
Type=forking
PIDFile=/run/vlmcsd.pid
ExecStart=/usr/local/kms/vlmcsd -L 0.0.0.0:1688 -l /var/log/kms.log -p /run/vlmcsd.pid
ExecStop=/bin/kill -HUP \$MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
" > /usr/lib/systemd/system/kms.service
  systemctl enable kms.service
  systemctl daemon-reload
  systemctl start kms.service
  echo ""
  echo -e "\033[46;30mNow, test the KMS Server service is running successfully or not.\033[0m"
  /usr/local/kms/vlmcs
  RET_CODE=$?
  if [ $RET_CODE == 0 ]; then
    echo -e "\033[46;30mYou see, testing is successful.\033[0m"
  else
    echo -e "\033[41;37mTesting FAILED! Something went wrong.\033[0m"
    echo ""
    exit $RET_CODE
  fi
  echo ""
  echo -e "\033[46;30mMission Succeeded.\033[0m"
  echo ""
  echo "Now, you can easily manage the KMS Server service through \`systemctl\` or \`service\` commands."
  echo "\`systemctl [start/stop/restart/status] kms\`"
  echo "\`service kms [start/stop/restart/status]\`"
  echo ""
  echo -e "\033[46;30mThank you! Are you OK?\033[0m"
  echo -e "\033[46;30mTony Chang <tonychang7869@gmail.com>\033[0m"
  echo ""
  rm -rf ./$CLONE_DIR
  exit 0
}

echo "################################################################"
echo "#          KMS Server One Key Deploy Script for Linux          #"
echo "################################################################"
get_dist_and_pm
if [ $DISTRO == 'unknown' ] || [ $PM == 'unknown' ]; then
  exit_when_distro_or_pm_unknown
fi
echo "This script will automatically deploy the KMS Server on a Linux Operating System just with one key."
echo "Author: Tony Chang <tonychang7869@gmail.com>"
echo "GitHub Repo: https://github.com/tony-aptx4869/one-key-kms"
echo "----------------------------------------"
echo "Your Linux Distro:   " $DISTRO
echo "Your Package Manager:" $PM
echo "----------------------------------------"
if [ $1 == '-y' ]; then
  echo "ARE YOU OK? Y/n: Y"
  start
fi
for chance in 1 2 3; do
  echo ""
  read -p "ARE YOU OK? Y/n:" choice
  case $choice in
  "Y")
    start
    break
    ;;
  "n")
    echo "Okay! Maybe next time you wanna say yes. JYANE!"
    echo ""
    exit 100
    ;;
  *)
    if [ $chance == 1 ]; then
      echo "Would you please just enter Y or n? Try again."
    elif [ $chance == 2 ]; then
      echo "Hey bro! Are you kidding me? One more chance."
    elif [ $chance == 3 ]; then
      echo "Alright! You just want to piss me off. SAYOUNARA!!!"
      echo ""
      exit 200
    fi
    ;;
  esac
done
