RT-Thread 1.2.2发布记录

RT-Thread 1.2.2版本是1.2.x系列的第三个bug修正版本，仅修正bug，不会引入新的特性，适用于产品使用。如果还在使用RT-Thread 1.1.x及以前的老版本，建议更新到1.2.x分支来。新项目建议使用RT-Thread 2.0.0开发分支，这个版本会在今年年底正式发布出来。

## 更改记录 ##

### 内核 ###
* 修正设备对象引用计数在打开设备失败依然递增的问题；
* 在执行静态内存块分配前，重置线程的errno；
* 修正timer未打开调试选项时，无用的静态函数定义（导致编译警告）；
* 启动timer前，对timer进行强制移除；

### 工具
* 修正scons命令编译时，选择keil mdk (armcc)编译器时，命令行太长编译失败的问题；

### 组件 ###
* Finsh: 修正当命令行太长导致的缓冲区移除的问题；
* libc: 修正arm libc中未使用DFS时的编译警告；
* lwIP 1.4.1: 默认打开LWIP_SO_SNDTIMEO以支持连接发送超时；
* lwIP 1.4.1: 修正MEMP_NUM_TCP_SEG定义错误的问题；
* lwIP 1.4.1: 加入RT_LWIP_REASSEMBLY_FRAG选项定义以支持IP分组及合并；
* lwIP 1.4.1: 用户可以重新定义RT_LWIP_ETH_MTU，以修改网络中的MTU值；
* lwIP 1.4.1: 修正LWIP_NETIF_LINK_CALLBACK条件编译的问题；
* log trace: 增加log_session_lvl接口；
* log trace: log trace中的session引用更改成常量形式；
* ymodem: 增强数据接收的稳定性；

### 移植 ###
* 修正龙芯1B移植（ls1bdev）中链接脚本关于组件初始化部分的配置；
* 修正STM32F40x中UART3的配置问题；
