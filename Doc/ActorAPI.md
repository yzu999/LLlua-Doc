# LiteLuaLoader接口

## 概述

服务器启动时，会执行lua文件夹下的所有lua文件。

Lua可以热重载，通过/lreload指令。

本文档讲为您介绍如何使用ActorAPI操作生物/玩家。

我们直接使用「指针」来代表生物，您可以将其理解生物的唯一标识符。

部分函数为玩家特有函数，请注意判断。

## 类型约定

共有5种类型，

- `bool`为布尔值，可选(true,false)

- `str`为字符串

- `int`为整数

- `num`为实数

## API文档描述约定

函数名(参数) -> (返回值,返回值...)</br>

函数介绍  

其中参数和返回值遵守以下格式:</br>

`名字:类型`  

例如:</br>

`playerPtr:int,v1:str`

## API列表

**发送文本(玩家特有API)**
 给玩家发送文本</br>

`Actor:sendText(玩家指针:int,文本:str [,文本类型:int])`

其中文本类型包括

- 0: RAW (聊天框)
- 3: POPUP (物品栏上)
- 4: JUKEBOX_POPUP (音乐盒 物品栏上)
- 5: TIP (物品栏上)

**以玩家身份执行指令(玩家特有API)**

`runCmdAs(玩家指针:int,指令:str)`
