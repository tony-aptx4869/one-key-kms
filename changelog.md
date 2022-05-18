changelog
====================

v0.0.3 - 2022-05-18 18:45:00 GMT+8
----------------------------------------
很快又更新啦！

解决一个问题。连我自己都觉得运行脚本之后，先敲一个大写字母 Y 再敲空格超级麻烦，另外也不方便 GitHub Action 自动运行检测。所以就加上一个命令行参数的形式 `./one-key-kms-linux.sh -y` 来免除运行脚本中敲击大写字母 Y 和空格键。

Update so soon!

Solved a problem. Even I feel that after running the script, typing a capital Y and then typing a space is really troublesome, and it is also inconvenient for GitHub Action to automatically run the detection. So I added a command line argument of the form `./one-key-kms-linux.sh -y` to avoid hitting the capital Y and the space during running the script.


v0.0.2 - 2022-05-18 11:45:27 GMT+8
----------------------------------------
修复 BUG：
+ `yum` 和 `apt` 包管理器需安装的包不同，做出区分，否则易出错；
+ 改正 `kms.service` 文件内容中的错误；

优化：
+ 退出函数独立出来，方便调用。

Fixed bugs:
+ The packages that `yum` and `apt` package managers need to install are different, so make a distinction, otherwise it is easy to make mistakes;
+ Fixed errors in the content of the file `kms.service` ;

Optimized:
+ The exit function is independent and easy to call.


v0.0.1 - 2022-05-15 05:14:00 GMT+8
----------------------------------------

第一个版本，详细介绍请参见 `README.md` 文件。

The first version, read the `README.md` file for details.
