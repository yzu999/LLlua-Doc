function getIndentSpace(indent)

     local str = ""

     for i =1, indent do

          str = str .. " "

     end

     return str

end





function newLine(indent)

     local str = "\n"

     str = str .. getIndentSpace(indent)

     return str

end





function createKeyVal(key, value, bline, deep, indent)

     local str = "";

     if (bline[deep]) then

     str = str .. newLine(indent)

     end

     if type(key) == "string" then

          str = str.. key .. " = "

     end

     if type(value) == "table" then

          str = str .. getTableStr(value, bline, deep+1, indent)

     elseif type(value) == "string" then

          str = str .. '"' .. tostring(value) .. '"'





     else

          str = str ..tostring(value)

     end

     str = str .. ","

     return str

end





function getTableStr(t, bline, deep, indent)





     local str

     if bline[deep] then

          str = newLine(indent) .. "{"

          indent = indent + 4

     else

          str = "{"

     end





     for key, val in pairs(t) do

          str = str .. createKeyVal(key, val, bline, deep, indent)

     end

     if bline[deep] then

          indent = indent-4

          str = str .. newLine(indent) .. "}"

     else

          str = str .. "}"

     end

     return str

end





function printtable(t)

     local str = getTableStr(t, {true, true, true}, 1, 0)

     print(str)

end



Listen("onMobDie",function (pl,id)

  print(pl)

  print(id)

end)



Listen("onChat",function (pl,msg)

  item = Actor:getHand(pl)

  nbt = Item:getNBT(item)

  printtable(nbt)

  return -1

end)



Listen("onLeft",function (pl)

  print(pl)

end)

Listen('onMobHurt',function (mob,ac)

  Actor:kill(mob)

end)

function FULL_CB(name,raw,data)

--- 如果开关分别打开，关闭，滑动到69，输入kksk，选择cat

--- name=”Steve”

--- raw = { 1: 0 (label),2:1 (打开开关),3:0 (关闭开关),4: 69, 5: “kksk”,6: 1 (选择第二项)}

--- data = { 1 : “cat” }

end
