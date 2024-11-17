---@module utility.roblox_drawing_impl.roblox_drawing
local roblox_drawing = require("utility/roblox_drawing_impl/roblox_drawing")

---@class text: roblox_drawing
---@field txt_base Frame
---@field instance_maid maid
local text = setmetatable({}, { __index = roblox_drawing })
text.__index = text
text.__tostring = function()
	return "roblox_drawing"
end

---@module utility.maid
local maid = require("utility/maid")

---@module utility.instance
local instance = require("utility/instance")

---detach drawing
function text:detach()
	self.instance_maid:do_cleaning()
end

---get field
---@param key string
---@return any
function text:get(key)
	if key == "Position" then
		local txt_pos = self.txt_base.Position
		return Vector2.new(txt_pos.X.Offset, txt_pos.Y.Offset)
	end

	if key == "TextBounds" then
		return self.txt_base.TextBounds
	end

	if key == "Size" then
		return self.txt_base.TextSize
	end

	if key == "Visible" then
		return self.txt_base.Visible
	end

	return nil
end

---set field
---@param key string
---@param value any
---@return any
function text:set(key, value)
	if key == "Outline" then
		self.txt_base.TextStrokeTransparency = value and 0.0 or 1.0
	end

	if key == "Color" then
		self.txt_base.TextColor3 = value
	end

	if key == "Transparency" then
		self.txt_base.TextTransparency = 1.0 - value
	end

	if key == "Text" then
		self.txt_base.Text = value
	end

	if key == "Font" then
		self.txt_base.Font = value == "Plex" and Enum.Font.Code or Enum.Font[value]
	end

	if key == "Center" then
		self.txt_base.TextXAlignment = value and Enum.TextXAlignment.Center or Enum.TextXAlignment.Left
	end

	if key == "Visible" then
		self.txt_base.Visible = value
	end

	if key == "ZIndex" then
		self.txt_base.ZIndex = value
	end

	if key == "Position" then
		self.txt_base.Position = UDim2.fromOffset(value.X, value.Y)
	end

	if key == "Size" then
		self.txt_base.TextSize = value
	end
end

---new text object
---@return text
function text.new()
	local self = setmetatable(roblox_drawing.new(), text)

	local instance_maid = maid.new()

	local txt_base = instance.create_instance(instance_maid, "txt_base", "TextLabel", self.screen_gui)
	txt_base.BackgroundTransparency = 1
	txt_base.TextYAlignment = Enum.TextYAlignment.Top
	txt_base.Visible = false

	self.txt_base = txt_base
	self.instance_maid = instance_maid

	return self
end

-- return text module
return text
