# json分析 #

## json SAX ##

原来STM32Radio用到的json parser，它是SAX方式进行分析。所以要想得到一个完整的
json object会比较困难。

## json tree ##

新的封装包括一个json树，通过调用原来的json parser，能够得到一个完整的json tree。

其中json tree的定义如下：

```c
struct json_tree
{
    struct json_node *root;

	int layer;
	struct json_node *node_stack[JSON_NODE_LAYER_MAX];
};
```

其中 ```layer``` 和 ```node_stack``` 用于json分析时保存节点上下文。一个json树由
root节点指出了，一个json节点的定义是：

```c
struct json_node
{
    int type;
	char* key;

	union
	{
		char* str_value;
		int int_value;
		int boolean_value;
		double float_value;

		struct json_node* array;
		struct json_node* child;
	} vu;
};
```

其中节点的 ```type``` 域指出这个节点属于哪种节点类型，目前支持的类型包括：

```c
#define JSON_NODE_TYPE_UNKNOWN      0x00
#define JSON_NODE_TYPE_STR		    0x01
#define JSON_NODE_TYPE_INT		    0x02
#define JSON_NODE_TYPE_FLOAT	    0x03
#define JSON_NODE_TYPE_BOOL		    0x04
#define JSON_NODE_TYPE_ARRAY	    0x05
#define JSON_NODE_TYPE_DICT		    0x06
```

## API接口 ##
