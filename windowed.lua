shell.run("cd /.")
menu = false

function winShell(program)
paintutils.drawLine(10,5,40,5,colors.orange)
term.setBackgroundColor(colors.orange)
term.setTextColor(colors.black)
term.setCursorPos(10,5)
print(program)
local run = window.create(term.current(),10,6,31,10)
oldterm = term.redirect(run)
term.setBackgroundColor(colors.black)
term.clear()
term.setTextColor(colors.white)
term.setCursorPos(1,1)
shell.run(program)
term.redirect(oldterm)

end

function textWindow(title,ln1,ln2,ln3)
paintutils.drawLine(10,5,40,5,colors.orange)
term.setTextColor(colors.black)
term.setBackgroundColor(colors.orange)
term.setCursorPos(10,5)
print(title)
term.setBackgroundColor(colors.red)
term.setCursorPos(40,5)
print("X")
text = window.create(term.current(),10,6,31,6)
oldterm = term.redirect(text)
term.setBackgroundColor(colors.white)
term.clear()
term.setTextColor(colors.black)
term.setCursorPos(1,1)
print(ln1)
print(ln2)
print(ln3)
term.redirect(oldterm)
term.setBackgroundColor(colors.green)
term.setCursorPos(23,10)
print("close")

while true do
local event,button,x,y = os.pullEvent("mouse_click")
if x >= 23 and x <= 27 and y == 10 or x == 40 and y == 5 then
shell.run("windowed")
end
end
end



function textBox(text,title)
drawScreen()
paintutils.drawLine(10,5,40,5,colors.orange)
paintutils.drawFilledBox(10,6,40,9,colors.white)
term.setBackgroundColor(colors.orange)
term.setTextColor(colors.black)
term.setCursorPos(10,5)
print(title)
term.setBackgroundColor(colors.white)
term.setCursorPos(10,6)
print(text)
term.setBackgroundColor(colors.red)
term.setCursorPos(40,5)
print("X")
paintutils.drawLine(11,8,39,8,colors.gray)
textbox = window.create(term.current(),11,8,28,1)
oldterm = term.redirect(textbox)
term.setBackgroundColor(colors.gray)
term.clear()
term.setTextColor(colors.black)
output = read()
term.setCursorPos(11,8)
term.clear()
--print(output)
term.redirect(oldterm)
term.setTextColor(colors.black)
term.setCursorPos(11,8)
print(output)
paintutils.drawFilledBox(10,10,40,11,colors.white)
term.setBackgroundColor(colors.green)
term.setCursorPos(11,10)
print("Ok")
term.setCursorPos(23,10)
print("Cancel")

while true do
local event,button,x,y = os.pullEvent("mouse_click")
if x == 40 and y == 5 or x >= 23 and x <= 29 and y == 10 then
shell.run("windowed")
elseif x >= 11 and x <= 12 and y == 10 then 
drawScreen()
break
  
end
end
end

function selection(text,title,button1,button2)
paintutils.drawLine(10,5,40,5,colors.orange)
paintutils.drawFilledBox(10,6,40,11,colors.white)
term.setBackgroundColor(colors.orange)
term.setTextColor(colors.black)
term.setCursorPos(10,5)
print(title)
term.setBackgroundColor(colors.red)
term.setCursorPos(40,5)
print("X")
term.setBackgroundColor(colors.white)
term.setCursorPos(10,6)
print(text)
term.setBackgroundColor(colors.green)
paintutils.drawLine(11,8,39,8)
paintutils.drawLine(11,10,39,10)
term.setCursorPos(11,8)
print(button1)
term.setCursorPos(11,10)
print(button2)

while true do
local event,button,x,y = os.pullEvent("mouse_click")
if x == 40 and y == 5 then
shell.run("windowed")
end

if x >= 11 and x <= 39 and y == 8 then
selected = "1"
break
elseif x >= 11 and x <= 39 and y == 10 then
selected = "2"
break
end
end
end


function drawScreen()
term.setBackgroundColor(colors.lightBlue)
term.clear()
backdrop = paintutils.loadImage("logo.nfp")
paintutils.drawImage(backdrop,1,2)
paintutils.drawLine(1,1,51,1,colors.orange)
term.setBackgroundColor(colors.orange)
if menu == true then term.setBackgroundColor(colors.red) end
term.setTextColor(colors.black)
term.setCursorPos(1,1)
print("| BeeOS |")
if menu == true then
term.setBackgroundColor(colors.blue)
term.setCursorPos(1,2)
print("about   ")
print("run     ")
print("options ")
print("games   ")
print("files   ")
print("shell   ")
print("edit    ")
print("power   ")
end

end

while true do
drawScreen()

local event,button,x,y = os.pullEvent("mouse_click")
if x <= 9 and y == 1 then
menu = true
end

if x >= 10 or y >= 11 then
menu = false
end

if x <= 8 and y == 3 and menu == true then
menu = false
drawScreen()
textBox("enter a command:","Run")
term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.setCursorPos(1,1)
term.clear()
shell.run(output)
shell.run("windowed")
elseif x <= 8 and y == 9 and menu == true then
menu = false
drawScreen()
selection("what do you want to do?","Power","shutdown","reboot")
if selected == "1" then
os.shutdown()
elseif selected == "2" then
os.reboot()
end
elseif x <= 8 and y == 4 and menu == true then
menu = false
drawScreen()
selection("select an option:","Options","edit backdrop","set password")
if selected == "1" then
shell.run("paint logo")
elseif selected == "2" then
textBox("type your new password:","Options")
local file = fs.open("pass.txt","w")
file.write(output)
file.close()
shell.run("startup")
shell.run("windowed")
end
elseif x <= 8 and y == 2 and menu == true then
menu = false
drawScreen()
textWindow("About","BeeOS version 23.11.0",_HOST,"Made by bennybest7")
elseif x <= 8 and y == 5 and menu == true then
menu = false
drawScreen()
selection("select a game:","Games","worm","adventure")
if selected == "1" then
winShell("worm")
elseif selected == "2" then
winShell("adventure")
end
shell.run("windowed")

elseif x <= 8 and y == 7 and menu == true then
menu = false
drawScreen()
winShell("shell")
shell.run("windowed")
elseif x <= 8 and y == 8 and menu == true then
menu = false
drawScreen()
textBox("type the path of the file:","Edit")
shell.run("edit",output)
elseif x <= 8 and y == 6 and menu == true then
menu = false
drawScreen()
shell.run("files")
shell.run("windowed")

end
end

