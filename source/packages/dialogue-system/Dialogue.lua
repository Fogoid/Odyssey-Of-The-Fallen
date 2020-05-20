local class = require("middleclass")

local Dialogue = class("Dialogue")

function Dialogue:initialize(messages)
	self.currentMessage = 1
	self.messages = messages
end

function Dialogue:startDialogue()
	inDialogue = true
end

function Dialogue:keypressed(key)
	if (key == "x") then
		if self.currentMessage == #self.messages then
			self:destroy()
		else
			self.currentMessage = self.currentMessage + 1
		end
	end
end

function Dialogue:draw()
	local width, height = love.graphics.getWidth(), love.graphics.getHeight()
	love.graphics.setColor(0.055, 0.055, 0.055)
	love.graphics.rectangle("fill", 25, (4*height/5) - 25, width - 50, height/5)
	love.graphics.setColor(0.669, 0.787, 0.787)
	love.graphics.printf(self.messages[self.currentMessage].speaker, 35, (4*height/5) - 15, width - 70, "left")
	love.graphics.setColor(0.83,0.83,0.83)
	love.graphics.printf(self.messages[self.currentMessage].message, 35, (4*height/5) + 9, width - 70, "left")
	love.graphics.setColor(1, 1, 1)
	love.graphics.print("X-Continue", width - 185, height - 59)
end

function Dialogue:destroy()
	inDialogue = false
	self.messages = nil
	self = nil
end

return Dialogue