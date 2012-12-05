# ART介绍 #

ART board是一块与[Arduino](http://arduino.cc)兼容的IO板，其中包含了一片ARM Cortex-M4的微控制处理器芯片。ART board由于RT-Thread社区主持开发，面向初学者，电子爱好者。ART board的目标是完全兼容Arduino软硬件环境，同时在上面能够运行相对复杂的程序（控制，音频，视频，网络），以及普及RT-Thread开源实时操作系统技术。

## 硬件介绍 ##

- 主控芯片：[STM32F407VGT6](http://www.st.com/internet/mcu/product/252140.jsp)
- 片内闪存：1MB
- 片内内存：128kB + 64kB (CCM, core coupled memory)
- 芯片频率：168MHz
- 1 USB FS slave
- 1 USB FS host
- 4 UART串口
- 3 SPI接口
- 1 IIC接口
- 1 CAN接口
- 1 SWD调试接口

硬件接口兼容Arduino Uno的接口，尺寸兼容Arduino MEGA板。可以使用Arduino Uno的IO扩展板，Arduino MEGA的IO扩展板。ART board包括了两个USB端口，这两个端口从物理上都能够做OTG设备以实现USB设备端和主机端功能，但为了区分，我们把它分别定义成USB设备端和USB主机端，并在固件软件上做相应的限定。USB设备端可以对ART board供电，同时支持PC端的在线编程（即一条USB线缆既可做电源供电，也可以烧写程序）。

## 软件介绍 ##

ART board在PC上可使用GNU GCC工具链进行编程，同时有相对应的ART_work工具，在ART_work工具内提供了ART上的相应示例程序，对ART board编程的程序等。ART board可执行Arduino语法的程序，完全兼容Arduino语法形式，及部分Arduino外设库（兼容外设库情况在持续增长中）。

ART_work软件主界面图

### 软件平台介绍 ###

ART board采用了开源的实时操作系统RT-Thread做为底层的平台，并充分利用RT-Thread所提供的底层引擎为上层的应用创造更多的支撑。

对ART board来说，RT-Thread的应用模块引擎无疑是最重要的部分。ART board携带的是STM32F407VGT6 MCU，这是一个ARM Cortex-M4的芯片，其中并未包括MMU硬件支持。这样的状况就决定了在上面不可能运行起一个基本的Linux开源系统（缺乏MMU就不可能支持带独立地址空间的进程）。在这种硬件条件下运行Arduino程序，要么类似官方Arduino板一样，把Arduino程序编译后直接在IO板上运行起来，只有一个程序实体。当要添加第二个Arduino程序时，必须与前一个Arduino程序融合在一起，一起编程、一起编译、一起运行。

而开源的RT-Thread应用模块引擎则提供了一种在线性扁平地址空间运行多个程序的可能：

- 每个程序可单独编程、编译；
- 每个程序可单独运行；
- 每个程序可单独烧写部署。

ART board上的软件结构图如下图所示。
