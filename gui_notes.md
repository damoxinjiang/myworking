# cursor驱动 #

主要为一些硬件已经提供了光标而写的驱动。

接口：

光标驱动除了RT-Thread Device的标准接口外不需要其他接口，GUI主要使用其中的rt_device_control接口。

意义：

```c
#define RT_DEVICE_CTRL_CURSOR_SET_POSITION      0x10
#define RT_DEVICE_CTRL_CURSOR_SET_TYPE		    0x11
```

其中

1. SET_POSTION用于设定硬件光标的位置

左上角的坐标是(0, 0)。传递给cursor驱动的值是rt_uint32_t值的地址，具体情况是：

```c
rt_uint32_t value;

value = (x < 16) | y;
```

其中x和y都是16位的带符号整数。

2. SET_TYPE用于设定光标的类型

目前定义了两种光标类型：

- RTGUI_CURSOR_ARROW, 箭头类型
- RTGUI_CURSOR_HAND, 手指类型

而这些类型在硬件光标的具体形状由底层驱动定义。

为GUI指定硬件光标设备，可以调用 ``` rtgui_cursor_set_device ``` 函数。在调用这个参数时需要给出实际存在的硬件设备名称，例如如下代码：

```c
rtgui_cursor_set_device("cursor");
```

这段代码用于向UI系统设定硬件光标设备是以"cursor"为名称的设备。

