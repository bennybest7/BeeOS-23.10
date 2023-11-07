io.write("Do you want do install BeeOS? [y/n] ")
if not read() == "y" then
os.reboot()
end

term.setBackgroundColor(colors.lightBlue)
term.clear()
function setBox()
paintutils.drawFilledBox(3,2,49,17,colors.white)
end
setBox()
term.setBackgroundColor(colors.white)
term.setCursorPos(4,3)
term.setTextColor(colors.black)
print("Welcome to BeeOS!, click 'continue' to begin")
term.setBackgroundColor(colors.green)
term.setCursorPos(4,16)
print("continue")

while true do
local event,button,x,y = os.pullEvent("mouse_click")
if x >= 4 and x <= 12 and y == 16 then
break
end
end

setBox()
term.setCursorPos(4,3)
term.setBackgroundColor(colors.white)
print("type your password:")
function password()
textbox = window.create(term.current(),4,5,20,1)
oldterm = term.redirect(textbox)
term.setBackgroundColor(colors.gray)
term.clear()
output = read()
term.clear()
term.setCursorPos(1,1)
term.redirect(oldterm)
term.setCursorPos(4,5)
term.setBackgroundColor(colors.gray)
print(output)
term.setBackgroundColor(colors.white)
term.setTextColor(colors.black)
end
password()
term.setBackgroundColor(colors.green)
term.setCursorPos(4,16)
print("continue")
while true do
local event,button,x,y = os.pullEvent("mouse_click")
if x >= 4 and x <= 24 and y == 5 then
password()
end

if x >= 4 and x <= 12 and y == 16 then
local file = fs.open("pass.txt","w")
file.write(output)
file.close()
break
end
end

setBox()
install = window.create(term.current(),4,3,45,14)
oldterm = term.redirect(install)
term.setBackgroundColor(colors.black)
term.clear()
term.setTextColor(colors.white)
shell.run("wget https://raw.githubusercontent.com/bennybest7/BeeOS-23.10/main/startup.lua startup.lua")
shell.run("wget https://raw.githubusercontent.com/bennybest7/BeeOS-23.10/main/windowed.lua windowed.lua")
shell.run("wget https://raw.githubusercontent.com/bennybest7/BeeOS-23.10/main/files.lua files.lua")
shell.run("wget https://raw.githubusercontent.com/bennybest7/BeeOS-23.10/main/shell.lua shell.lua")
shell.run("wget https://raw.githubusercontent.com/bennybest7/BeeOS-23.10/main/logo.nfp logo.nfp")
term.redirect(oldterm)
setBox()

term.setBackgroundColor(colors.white)
term.setTextColor(colors.black)
term.setCursorPos(4,3)
print("All done! what do you want do do?")
term.setBackgroundColor(colors.green)
term.setCursorPos(4,16)
print("reboot")
term.setBackgroundColor(colors.gray)
term.setCursorPos(4,14)
print("shell")

while true do
local event,button,x,y = os.pullEvent("mouse_click")
if x >= 4 and x <= 10 and y == 16 then
os.reboot()
elseif x >= 4 and x <= 9 and y == 14 then
term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1,1)
shell.run("sh")
end
end
