RT-Thread 2.0.0 beta

## 更改记录 ##

### 内核 ###
* 移除rt_device_init_all()函数：在系统启动时不需要再调用这个函数来初始化驱动，而是由上层应用执行rt_device_open时自动进行设备初始化；
* 修正设备对象引用计数在打开设备失败依然递增的问题；
* 增加WEAK宏用于定义/声明弱符号；
* 在执行静态内存块分配前，重置线程的errno；
* 修正timer未打开调试选项时，无用的静态函数定义（导致编译警告）；
* 启动timer前，对timer进行强制移除；
* 在执行soft timer超时函数时，打开调度器锁；
* 新增块设备的自动刷新参数，RT_DEVICE_CTRL_BLK_AUTOREFRESH；

### 工具 ###
* 修正scons命令编译时，选择keil mdk (armcc)编译器时，命令行太长编译失败的问题；

### 移植 ###
* 移除rt_device_init_all()相关的调用；
* 根据串口框架调整相关的驱动代码；
* 加入frdm-k64f移植（FreeScale K64芯片）；
* 移除K60Fxxxx移植；
* 新增LPC43xx移植（NXP LPC4357芯片）；
* 移除LPC176x中的组件初始化配置；
* 修正龙芯1B移植（ls1bdev）中链接脚本关于组件初始化部分的配置；
* 修正STM32F40x中UART3的配置；
* 修正STM32F40x中GNU GCC连接脚本中ROM/RAM大小的配置；
* 移除STM32F107中的组件初始化配置；
* 增强STM32F107 EMAC驱动性能，同时加入自动查找PHY芯片地址功能；
* 重写xplorer4330（NXP LPC4330芯片）移植（xiaonong完成）；

### 组件 ###
* DFS: 新增根据设备对象获得其上装载文件系统路径的函数：dfs_filesystem_get_mounted_path(struct rt_device* device);
* DeviceDrivers：新增workqueue实现；
* DeviceDrivers: 修正USB Device栈中的一些拼写错误；
* DeviceDrivers: 重写serial框架，能够让串口设备驱动同时支持三种模式：poll、interrupt、DMA。模式选择需要在执行rt_device_open时，由open flags指定；
* Finsh: list_device()命令中增加refcount的信息；
* Finsh: 修正'0'零常量无法识别的错误；
* Finsh: mv命令，实现把一个文件移动到一个目录中；
* Finsh: ifconfig命令支持对一个网络接口的基本配置；
* Finsh: 新增netstat命令，用于显示当前系统中TCP连接的状态；
* Finsh: 修正当命令行太长导致的缓冲区移除的问题；
* libc: 修正arm libc中未使用DFS时的编译警告；
* lwIP 1.4.1: 默认打开LWIP_SO_SNDTIMEO以支持连接发送超时；
* lwIP 1.4.1: 修正MEMP_NUM_TCP_SEG定义错误的问题；
* lwIP 1.4.1: 加入RT_LWIP_REASSEMBLY_FRAG选项定义以支持IP分组及合并；
* lwIP 1.4.1: ethnet网络接口支持定义LWIP_NO_TX_THREAD/LWIP_NO_RX_THREAD，以关闭etx/erx线程；
* lwIP 1.4.1: 用户可以重新定义RT_LWIP_ETH_MTU，以修改网络中的MTU值；
* lwIP 1.4.1: 修正LWIP_NETIF_LINK_CALLBACK条件编译的问题；
* lwIP 1.4.1: 完善移植相关的注释；
* log trace: 增加log_session_lvl接口；
* log trace: log trace中的session引用更改成常量形式；
* ymodem: 增强数据接收的稳定性；
