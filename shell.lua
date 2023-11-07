args = ...
shell.run("cd /.")
function textBox(title)
paintutils.drawLine(2,2,22,2,colors.orange)
paintutils.drawFilledBox(2,3,22,5,colors.white)
term.setBackgroundColor(colors.orange)
term.setCursorPos(2,2)
print(title)
textbox = window.create(term.current(),3,4,18,1)
oldterm = term.redirect(textbox)
term.setBackgroundColor(colors.gray)
term.clear()
output = read()
term.redirect(oldterm)
term.setBackgroundColor(colors.lightBlue)
term.setTextColor(colors.black)
term.clear()
term.setCursorPos(1,1)
end
function cleanUp()
term.setBackgroundColor(colors.cyan)
term.clear()
term.setTextColor(colors.black)
term.setCursorPos(1,1)
end
cleanUp()
print("hello! welcome to BeeOS shell.")
print("for a list of commands, type 'list command'.")
print("to exit, type 'exit'.")
if args == "winerr" then
term.setTextColor(colors.red)
print("something went wrong running windowed.")
term.setTextColor(colors.black)
end
while true do
io.write("->")
command = read()

if command == "list command" then
print("list dir | list command")
print("set dir  | shutdown")
print("run      | reboot")
print("edit     | reset")
print("exit")
print("mkdir")
print("delete")
print("lua")
print("clear")
elseif command == "list dir" then
shell.run("ls")
elseif command == "set dir" then
textBox("set dir")
cleanUp()
shell.run("cd",output)
shell.run("ls")
elseif command == "run" then
textBox("run")
term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
shell.run(output)
cleanUp()
elseif command == "edit" then
textBox("edit")
shell.run("edit",output)
cleanUp()
elseif command == "exit" then
if args == "winerr" then
shell.run("windowed")
else break end

elseif command == "mkdir" then
textBox("mkdir")
shell.run("mkdir",output)
cleanUp()
elseif command == "delete" then
textBox("delete")
shell.run("delete",output)
cleanUp()
elseif command == "lua" then
shell.run("lua")
term.setBackgroundColor(colors.cyan)
term.setTextColor(colors.black)
elseif command == "clear" then
cleanUp()
elseif command == "reboot" then
os.reboot()
elseif command == "shutdown" then
os.shutdown()
elseif command == "reset" then
shell.run("shell")
end
end
