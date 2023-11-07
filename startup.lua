args = ...
term.setBackgroundColor(colors.lightBlue)
term.setTextColor(colors.black)
term.clear()
local image = paintutils.loadImage("logo.nfp")
paintutils.drawImage(image,1,2)
term.setBackgroundColor(colors.white)
paintutils.drawFilledBox(17,6,33,10)
term.setCursorPos(18,7)
print("enter password:")
if args == "wrong" then
term.setTextColor(colors.red)
term.setCursorPos(15,9)
print("password is incorrect.")
end
local textbox = window.create(term.current(),18,8,15,1)
oldterm = term.redirect(textbox)
term.setBackgroundColor(colors.gray)
term.clear()
term.setTextColor(colors.black)
pass = read("*")
term.redirect(oldterm)

local file = fs.open("pass.txt","r")
local correct = file.readAll()
file.close()

if pass == correct then
term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1,1)
shell.run("windowed")
shell.run("shell winerr")
else
shell.run("startup wrong")
end

