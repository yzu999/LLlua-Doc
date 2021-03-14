# LiteLuaLoader接口

## 概述

服务器启动时，会执行lua文件夹下的所有lua文件。

Lua可以热重载，通过/lreload指令。

- 给所有人发送文本</br>
`bcText(文本:str [,文本类型:int])`

其中文本类型包括

- 0: RAW (聊天框)
- 3: POPUP (物品栏上)
- 4: JUKEBOX_POPUP (音乐盒 物品栏上)
- 5: TIP (物品栏上)

`runCmd(指令:str)`->bool</br>
以控制台身份运行指令</br>
返回指令是否运行成功</br>
例如: `runCmd(”/me test”)`</br>
*注：如果使用clear一类指令，clear失败返回false*

`runCmdEx(指令:str)`->(bool,str)</br>
以**控制台**运行并**获取输出**</br>
例如:
<pre>
success,output=runCmdEx(“/clear Steve dirt 3”)
Print(success,output)  -- true     output.....
</pre>

`schedule(回调函数名:str,定时间隔:int,第一次执行延迟:int)`->int</br>
计划定时任务 返回int，表示任务id</br>

`cancel(任务id:int)`
通过schedule返回的任务ID取消任务</br>
例如:
<pre>
function timer()
print(“hi”)
end
id=schedule(“timer”,10,0)     --- 每5秒执行一次
schedule(“timer”,0,10)     --- 5秒后执行，只执行一次
schedule(“timer”,10,10)    --- 5秒后执行第一次，每5秒再执行一次

cancel(id)    --- 取消第一个任务
</pre>

**获取在线玩家列表:** 
`oList()`->table

**获取玩家列表，table从1开始:** 

`oListV()`->str</br>

获取文本形式玩家列表，如`["a","b"]`

**设置在线人数**

`setOnlineNum(num:int,max:int)`

**注册指令**

`makeCommand(cmd:str,des:str,lv:int)`
lv的范围是0~5,0为所有人可见

重载:`makeCommand(cmd:str,des:str)`

### 数据库相关
`dget(玩家名:str,数据名:str)`->nil or str</br>
获取玩家储存数据，如果不存在返回nil，否则返回str</br>
例如: `dget(“steve”,”hasSigned”)`

`dput(玩家名:str,数据名:str,数据:xstr)`</br>
保存数据

`ddel(玩家名:str,数据名:str)`</br>
删除数据

**注册监听器**

其中，事件包括

事件名|触发类型|参数|参数实例|备注
--|---|---|---|--
onJoin| 玩家进入服务器 |(PlayerPtr:int)|(114514)| |
onLeft|玩家退出|(PlayerPtr:int)|(114514)| |
onChat(可取消)|玩家发言|PlayerPtr:int,msg:str)|(114514,"hello")| |
onCMD(可取消)|玩家输入指令|(SenderPtr:int,cmd:str)|(0,"me hello")| SenderPtr可能为0|
onMobDie|实体死亡|(ActorPtrA:str,ActorPtrB:int)|(1234,4132)|ActorPtrA为死亡生物指针,ActorPtrB为杀死该生物的生物的指针(可能为0)|
onMobHurt|实体受伤|(ActorPtrA:str,ActorPtrB:int)|(1234,4132)|ActorPtrA为受伤生物指针,ActorPtrB为攻击该生物的生物的指针(可能为0)|

*取消事件只需 return -1*

## 进行调试
控制台输入`!lua`可以进入lua交互shell</br>
输入两次回车执行内容</br>
输入`bye`回车，退出shell
