# LiteLuaLoader接口

## 概述

服务器启动时，会执行lua文件夹下的所有lua文件。

Lua可以热重载，通过/lreload指令。

本文档讲为您介绍如何使用ItemAPI操作物品。

我们直接使用「指针」来代表物品，您可以将其理解物品的唯一标识符。
　　
### **获取物品id**  </br>
`Item:getId(物品指针:int) -> id:int`

### **获取物品CustomName**  </br>
`Item:getCustomName(物品指针:int) -> customname:str`

### **获取物品名称**  </br>
`Item:getName(物品指针:int) -> name：str`

### **获取物品特殊值**  </br>
`Item:getAuxId(物品指针:int) -> id:int`

### **获取物品是否为空**  </br>
`Item:isNull(物品指针:int) -> bool`
