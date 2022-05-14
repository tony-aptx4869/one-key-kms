# one-key-kms

## 简介 / Introduction

在 Linux 系统一键部署 KMS Server 程序的 Shell 脚本，且会将 KMS Server 做成 service 以方便日常管理。

目前仅支持使用 `yum` 或者 `apt` 作为包管理器的 Linux 发行版系统。服务器要追求稳定，一般都会使用 CentOS、Rocky 这些操作系统吧，再不济的，像作者比较喜欢用 Ubuntu 系统。 (#^.^#)

该一键部署脚本仅在 CentOS、Rocky、Ubuntu 等常见 Linux 发行版，且仅在少数常用版本上进行过测试，无法 100% 保证在您的系统环境下执行无任何异常。请您使用前仔细阅读脚本命令，判断是否可以在你的系统上执行。

A Shell script to deploy the KMS Server program with one key on Linux operating system, and make the KMS Server be a service to facilitate daily management.

Currently only Linux distros which use `yum` or `apt` as package managers are supported. For servers to pursue stability, they generally use operating systems such as CentOS and Rocky. No matter how bad it is, I prefer to use Ubuntu system. (#^.^#)

This one key deployment script has only been tested on common Linux distros such as CentOS, Rocky, and Ubuntu, and has only been tested on a few commonly used versions. There is no 100% guarantee that it will execute without any exceptions in your system environment. Please read the script command carefully before use to determine whether it can be executed on your operating system.

## 测试结果 / Test Results

| Linux Distro & Version | Test Result |
| ---------------------- | :---------: |
| CentOS Stream 9        | :o: OK      |
| CentOS Stream 8        | :o: OK      |
| CentOS 7.9.2009        | :o: OK      |
| Rocky 8.5              | :o: OK      |
| TencentOS 3.1          | :o: OK      |
| OpenCloudOS 8.5        | :o: OK      |
| Ubuntu 20.04.4 LTS     | :o: OK      |

## 使用 / Usage

**请务必使用 root 用户运行此脚本！**

**MUST BE SURE to run this script as root!**

``` shell
git clone https://github.com/tony-aptx4869/one-key-kms.git
cd one-key-kms
chmod +x one-key-kms-linux.sh
./one-key-kms-linux.sh
```

运行脚本，敲入大写字母 Y 后回车，剩下的脚本会搞定。

脚本运行完毕，正常的情况下，KMS Server 的 service 已经跑起来了，可以使用以下命令进行管理：

Run the script, type a capital Y and hit enter, and the rest of the script will be done.

After script is finished running. Under normal circumstances, the service of the KMS Server has already started. You can use the following commands to manage it:

``` shell
service kms start
service kms stop
service kms restart
service kms status
```

以上四条命令也可以写成：

The above four commands can also be written as:

``` shell
systemctl start kms
systemctl stop kms
systemctl restart kms
systemctl status kms
```

## 鸣谢 / Thanks

鸣谢 KMS Server 程序的开发者 Wind4。

他的传送门：

Thanks to Wind4, the developer of the KMS Server program.

URL to his GitHub Repo:

https://github.com/Wind4/vlmcsd
