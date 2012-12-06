# 原生模式编程 #

从[gihub](https://github.com/RT-Thread/ART)[下载基本工程](https://github.com/RT-Thread/ART/tree/master/software/basic)，这是一个实现最基本功能的工程。

如果喜欢使用keil mdk，可以通过如下方式转换
> `scons --target=keil -s`

如果喜欢iar，可以通过如下方式获得工程文件
> `scons --target=iar -s`

这个工程包括的功能：

- 基本的内核
- 基本的命令行
- 如果使用USB连接电脑，可以使用USB串口
- 如果使用真实串口，可以使用ttl线连接RX0, TX0

这里推荐使用USB线直接连接方式（但使用USB方式会忽略启动时信息；在系统当机时也不能输出出错信息）。

另外ART板也包括一个swd调试接口，可用于连接支持swd的仿真器，例如常用的ulink2, jlink等仿真器。当使用仿真器连接swd时，可以配合keil mdk或iar等工具进行源代码调试。

ART swd连接20 pin JTAG如下图所示:

![SWD](http://github.com/BernardXiong/myworking/raw/master/ART/swd.png)

请注意下图中的20 pin JTAG缺口是朝上的。