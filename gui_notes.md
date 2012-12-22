# cursor驱动 #

主要为一些硬件已经提供了光标而写的驱动。

## 驱动接口 ##

光标驱动除了RT-Thread Device的标准接口外不需要其他接口，GUI主要使用其中的rt_device_control接口。

rt_device_control中的cmd参数意义：

```c
#define RT_DEVICE_CTRL_CURSOR_SET_POSITION      0x10
#define RT_DEVICE_CTRL_CURSOR_SET_TYPE		    0x11
```

其中

1. SET_POSTION用于设定硬件光标的位置

左上角的坐标是(0, 0)。传递给cursor驱动的值是rt_uint32_t值的地址，具体设置方式是：

```c
rt_uint32_t value;

value = (x < 16) | y;
```

其中x和y都是16位的带符号整数，这样也可能设定出带负数的值出来，底层驱动需要根据情况是直接忽略还是归零到(0, 0)坐标位置上。

2. SET_TYPE用于设定光标的类型

目前定义了两种光标类型：

- RTGUI_CURSOR_ARROW, 箭头类型
- RTGUI_CURSOR_HAND, 手指类型

这些类型的硬件光标具体形状则由底层驱动定义，上层GUI仅仅给出期望的光标类型。

## 设定光标设备 ##

为GUI指定硬件光标设备，可以调用 ``` rtgui_cursor_set_device ``` 函数。在调用这个参数时需要给出实际存在的硬件设备名称，例如如下代码：

```c
rtgui_cursor_set_device("cursor");
```

这段代码用于向UI系统设定硬件光标设备是以"cursor"为名称的设备。在设定硬件光标设备后，GUI系统会根据系统的运行情况访问硬件光标设备，使得光标合理的呈现给用户。

