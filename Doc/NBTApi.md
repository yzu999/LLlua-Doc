# LiteLuaLoader接口

## 概述

服务器启动时，会执行lua文件夹下的所有lua文件。

Lua可以热重载，通过/lreload指令。

NBT为mc储存信息的主要方式之一，它包含了物品/生物/方块的大部分信息，通常情况下NBT可读性较差。

本文档讲为您介绍如何使用NBTAPI。

不同于其他加载器，我们用table来描述NBT而不是json，这使得性能大幅度提升。

### **获取物品id**  </br>
`NBT:fromItem(物品指针:int) -> NBT:table`

~~其他的在写了~~
