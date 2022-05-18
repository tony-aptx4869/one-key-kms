changelog
====================

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
