---@module utility.roblox_drawing_impl.roblox_drawing
local roblox_drawing = require("utility/roblox_drawing_impl/roblox_drawing")

---@class square: roblox_drawing
---@field sq_base Frame
---@field sq_stroke UIStroke
---@field instance_maid maid
---@field filled boolean
---@field last_thickness number
---@field last_size Vector2
---@field last_position Vector2
local square = setmetatable({}, { __index = roblox_drawing })
square.__index = square
square.__tostring = function()
	return "roblox_drawing"
end

---@module utility.maid
local maid = require("utility/maid")

---@module utility.instance
local instance = require("utility/instance")

---detach drawing
function square:detach()
	self.instance_maid:do_cleaning()
end

---get field
---@param key string
---@return any
function square:get(key)
	if key == "Position" then
		local sq_pos = self.sq_base.Position
		return Vector2.new(sq_pos.X.Offset, sq_pos.Y.Offset)
	end

	if key == "Size" then
		return Vector2.new(self.last_size.X, self.last_size.Y)
	end

	return nil
end

---set field
---@param key string
---@param value any
---@return any
function square:set(key, value)
	if key == "Position" then
		self.last_position = value
	end

	if key == "Size" then
		self.last_size = value
	end

	if key == "Filled" then
		self.sq_base.BackgroundTransparency = value and 0 or 1
		self.sq_stroke.Transparency = value and 1 or 0
		self.filled = value
	end

	if key == "Thickness" then
		self.sq_stroke.Thickness = self.filled and 0 or value
		self.last_thickness = value
	end

	if key == "ZIndex" then
		self.sq_base.ZIndex = value
	end

	if key == "Visible" then
		self.sq_base.Visible = value
	end

	if key == "Color" then
		self.sq_base.BackgroundColor3 = value
		self.sq_stroke.Color = value
	end

	if not self.filled then
		self.sq_base.Position =
			UDim2.fromOffset(self.last_position.X + self.last_thickness, self.last_position.Y + self.last_thickness)
		self.sq_base.Size =
			UDim2.fromOffset(self.last_size.X - self.last_thickness * 2, self.last_size.Y - self.last_thickness * 2)
	else
		self.sq_base.Position = UDim2.fromOffset(self.last_position.X, self.last_position.Y)
		self.sq_base.Size = UDim2.fromOffset(self.last_size.X, self.last_size.Y)
	end
end

---new square object
---@return square
function square.new()
	local self = setmetatable(roblox_drawing.new(), square)

	local instance_maid = maid.new()

	local sq_base = instance.create_instance(instance_maid, "sq_base", "Frame", self.screen_gui)
	local sq_stroke = instance.create_instance(instance_maid, "sq_stroke", "UIStroke", sq_base)

	sq_base.BackgroundTransparency = 1
	sq_base.BorderSizePixel = 0

	self.sq_base = sq_base
	self.sq_stroke = sq_stroke
	self.instance_maid = instance_maid
	self.filled = false
	self.last_thickness = 0.0
	self.last_size = Vector2.new(0, 0)
	self.last_position = Vector2.new(0, 0)

	return self
end

-- return square module
return square
