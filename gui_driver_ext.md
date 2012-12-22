# GUI扩展驱动 #

GUI的驱动扩展接口主要用于一些有额外硬件处理能力的设备，它是附加于RT-Thread GUI标准图形驱动之外的驱动扩展。当GUI中使用了驱动扩展接口时，它能够把底层硬件的额外处理能力发挥出来，例如一些2D硬件加速操作，使得渲染图形操作变得更为迅速。

## GUI扩展驱动接口 ##

RT-Thread GUi扩展驱动接口主要由如下的操作接口定义：

```c
/* graphic extension operations */
struct rtgui_graphic_ext_ops
{
    /* some 2D operations */
	void (*draw_line)(rtgui_color_t *c, int x1, int y1, int x2, int y2);

	void (*draw_rect)(rtgui_color_t *c, int x1, int y1, int x2, int y2);
	void (*fill_rect)(rtgui_color_t *c, int x1, int y1, int x2, int y2);

	void (*draw_circle)(rtgui_color_t *c, int x, int y, int r);
	void (*fill_circle)(rtgui_color_t *c, int x, int y, int r);

	void (*draw_ellipse)(rtgui_color_t *c, int x, int y, int rx, int ry);
	void (*fill_ellipse)(rtgui_color_t *c, int x, int y, int rx, int ry);
};
```

1. draw_line接口，在屏幕上绘制一条线，其坐标是(x1, y1) - (x2, y2)，颜色使用c指定的颜色。
2. draw_rect接口，在屏幕上绘制一个矩形，其坐标是(x1, y1) - (x1, y2) - (x2, y2) - (x1, y2)，颜色使用c指定的颜色。
3. fill_rect接口，在屏幕上填充一个矩形，其坐标是(x1, y1) - (x1, y2) - (x2, y2) - (x1, y2)，颜色使用c指定的颜色。
4. draw_circle接口，在屏幕上绘制一个圆形，圆心坐标是(x, y)，圆半径是r，颜色使用c指定的颜色。
5. fill_circle接口，在屏幕上填充一个圆形，圆心坐标是(x, y)，圆半径是r，颜色使用c指定的颜色。
6. draw_ellipse接口，在屏幕上绘制一个椭圆，椭圆中心坐标是(x, y)，x轴半径是rx，y轴半径是ry，颜色使用c指定的颜色。
7. fill_ellipse接口，在屏幕上填充一个椭圆，椭圆中心坐标是(x, y)，x轴半径是rx，y轴半径是ry，颜色使用c指定的颜色。

## 编写GUI扩展驱动 ##

### 为系统指定图形驱动 ###

当为系统指定某个图形驱动时（通常通过以下的接口为RT-Thread GUI指定图形驱动）：

``` rt_err_t rtgui_graphic_set_device(rt_device_t device); ```

其中device指向了图形驱动的设备对象。

当RT-Thread GUI执行rtgui_graphic_set_device时，它也会向图形驱动设备询问是否有扩展支持，如果有扩展，则GUI系统会自动使用扩展以加速绘图操作。其中关键的操作在于GUI系统会通过：

```c
    const struct rtgui_graphic_ext_ops **ext_ops;
    result = rt_device_control(device, RTGRAPHIC_CTRL_GET_EXT, &ext_ops);
```

这样 ```rt_device_control``` 的方式，从图形驱动中获得扩展能力。如果图形驱动包含绘图扩展，则返回RT_EOK，并把struct rtgui_graphic_ext_ops结构体的指针返回给ext_ops。
