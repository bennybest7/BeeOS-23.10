shell.run("cd /.")

function textBox(title)
term.setTextColor(colors.black)
paintutils.drawLine(2,2,22,2,colors.orange)
paintutils.drawFilledBox(2,3,22,5,colors.white)
term.setCursorPos(2,2)
term.setBackgroundColor(colors.orange)
print(title)
textbox = window.create(term.current(),3,4,19,1)
oldterm = term.redirect(textbox)
term.setBackgroundColor(colors.gray)
term.clear()
output = read()
term.redirect(oldterm)
draw()
end

function draw()
term.setBackgroundColor(colors.cyan)
term.clear()
term.setTextColor(colors.black)
term.setCursorPos(1,1)
term.setBackgroundColor(colors.green)
print("set dir")
term.setCursorPos(9,1)
print("delete")
term.setCursorPos(16,1)
print("run")
term.setBackgroundColor(colors.red)
term.setCursorPos(1,2)
print("edit")
term.setCursorPos(6,2)
print("mkdir")
term.setCursorPos(12,2)
print("exit")
term.setCursorPos(1,3)
term.setBackgroundColor(colors.cyan)
shell.run("ls")
term.setCursorPos(1,1)
end
draw()

while true do
draw()
local event,button,x,y = os.pullEvent("mouse_click")

if x <= 7 and y == 1 then
textBox("set dir")
shell.run("cd",output)
elseif x >=  9 and x <= 15 and y == 1 then
textBox("delete")
shell.run("delete",output)
elseif x >= 16 and x <= 18 and y == 1 then
textBox("run")
shell.run(output)
elseif x <= 4 and y == 2 then
textBox("edit")
shell.run("edit",output) 
elseif x >= 6 and x <= 10 and y == 2 then
textBox("mkdir")
shell.run("mkdir",output)
elseif x >= 12 and x <= 15 and y == 2 then shell.run("cd /.") break end
end
