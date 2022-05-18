#! /bin/bash
## A Shell script to get distro and package-manager on Linux.
## Author: Tony Chang <tonychang7869@gmail.com>
## GitHub Repo: https://github.com/tony-aptx4869/one-key-kms

DISTRO='unkown'
PM='unkown'

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

get_dist_and_pm
if [ $DISTRO == 'unkown' ] || [ $PM == 'unkown' ]; then
  echo "Sorry! Your Linux Distro or PM is UNKOWN. This script cannot run in this OS. Goodbye!"
  exit 0
fi

