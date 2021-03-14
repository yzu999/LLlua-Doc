# LiteLuaLoader接口

## 概述

服务器启动时，会执行lua文件夹下的所有lua文件。

Lua可以热重载，通过/lreload指令。

本文档讲为您介绍如何使用ActorAPI操作生物/玩家。

我们直接使用「指针」来代表生物，您可以将其理解生物的唯一标识符。

玩家指针为生物指针的子集。

部分函数为玩家特有函数，请注意判断。

## API列表

### **发送文本(玩家特有API)**  
 给玩家发送文本</br>

`Actor:sendText(玩家指针:int,文本:str [,文本类型:int])`

其中文本类型包括

- 0: RAW (聊天框)
- 3: POPUP (物品栏上)
- 4: JUKEBOX_POPUP (音乐盒 物品栏上)
- 5: TIP (物品栏上)

### **以玩家身份执行指令(玩家特有API)**

`Actor:runCmdAs(玩家指针:int,指令:str) -> bool`

返回指令是否执行成功，参考链式命令方块

### **获取玩家IP(玩家特有API)**

`Actor:getIP(玩家指针:int) -> str`

返回玩家IP

### **获取玩家权限状态(玩家特有API)**

`Actor:isOP(玩家指针:int) -> bool`

### **强制踢出游戏(玩家特有API)**

`Actor:forceKick(玩家指针:int)`

### **获取玩家手持物品(玩家特有API)**

`Actor:getHand(玩家指针:int) -> int`

返回玩家手持物品指针，使用方法参考ItemAPI部分

### **获取生物类型ID**

`Actor:getEntityTypeId(生物指针:int) -> int`

### **获取生物名称**

`Actor:getName(生物指针:int) -> str`

### **获取生物坐标**

`Actor:getPos(生物指针:int) -> x:num,y:num,z:num,dim:int'

- x:x坐标
- y:y坐标
- z:z坐标
- dim:维度Id

### **强制杀死生物**

`Actor:kill(生物指针:int)`

### **隐身**

`Actor:vanish(玩家指针:int,生物指针:int)`
让指定玩家看不到某生物

重载:
`Actor:vanish(生物指针:int)`
让所有玩家看不到某一生物

### **强制传送**

`Actor:teleport(生物指针:int,x:num,y:num,z:num,dim:int`

### **获取生物背包物品(可能为玩家仅有，没试)**
`Actor:getPlayerInv(生物指针:int) -> inv:table`

