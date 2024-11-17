---@module utility.roblox_drawing_impl.roblox_drawing
local roblox_drawing = require("utility/roblox_drawing_impl/roblox_drawing")

---@class triangle: roblox_drawing
---@field instance_maid maid
---@field stored_point_a Vector2
---@field stored_point_b Vector2
---@field stored_point_c Vector2
---@field left_ward ImageLabel
---@field right_ward ImageLabel
local triangle = setmetatable({}, { __index = roblox_drawing })
triangle.__index = triangle
triangle.__tostring = function()
	return "roblox_drawing"
end

---@module utility.maid
local maid = require("utility/maid")

---@module utility.instance
local instance = require("utility/instance")

---detach drawing
function triangle:detach()
	self.instance_maid:do_cleaning()
end

---update triangles
---@note: thanks @ https://github.com/EgoMoose/Articles/blob/master/2d%20triangles/2d%20triangles.md
function triangle:update()
	local edges = {
		{
			longest = (self.stored_point_c - self.stored_point_a),
			other = (self.stored_point_b - self.stored_point_a),
			origin = self.stored_point_a,
		},
		{
			longest = (self.stored_point_a - self.stored_point_b),
			other = (self.stored_point_c - self.stored_point_b),
			origin = self.stored_point_b,
		},
		{
			longest = (self.stored_point_b - self.stored_point_c),
			other = (self.stored_point_a - self.stored_point_c),
			origin = self.stored_point_c,
		},
	}

	local edge = edges[1]
	for i = 2, #edges do
		if edges[i].longest.Magnitude <= edge.longest.Magnitude then
			continue
		end

		edge = edges[i]
	end

	local theta = math.acos(edge.longest.Unit:Dot(edge.other.Unit))

	local width_right_magnitude = math.cos(theta) * edge.other.Magnitude * edge.longest.Unit
	local width_left_magnitude = edge.longest - width_right_magnitude
	local height_magnitude = math.sin(theta) * edge.other.Magnitude

	local rotation_magnitude = width_right_magnitude - edge.other
	local rotation = math.atan2(rotation_magnitude.Y, rotation_magnitude.X) - math.pi / 2

	local direction = -edge.other:Cross(rotation_magnitude)
	local top_left_corner_right = edge.origin + edge.other
	local top_left_corner_left = direction < 0 and top_left_corner_right - width_right_magnitude
		or top_left_corner_right + width_left_magnitude

	local width_right_pos = top_left_corner_right - top_left_corner_left
	local width_left_pos = width_right_pos.Unit * (edge.longest.Magnitude - width_right_pos.Magnitude)

	local center_right_pos = top_left_corner_right + (width_left_pos + rotation_magnitude) * 0.5
	local center_left_pos = top_left_corner_left + (width_right_pos + rotation_magnitude) * 0.5

	self.right_ward.Position = UDim2.new(0, center_right_pos.X, 0, center_right_pos.Y)
	self.right_ward.Size = UDim2.new(0, width_left_pos.Magnitude + 1, 0, height_magnitude)
	self.right_ward.Rotation = math.deg(rotation)

	self.left_ward.Position = UDim2.new(0, center_left_pos.X, 0, center_left_pos.Y)
	self.left_ward.Size = UDim2.new(0, width_right_pos.Magnitude, 0, height_magnitude)
	self.left_ward.Rotation = math.deg(rotation)
end

---get field
---@param key string
---@return any
function triangle:get(key)
	if key == "PointA" then
		return self.stored_point_a
	end

	if key == "PointB" then
		return self.stored_point_b
	end

	if key == "PointC" then
		return self.stored_point_c
	end

	return nil
end

---set field
---@param key string
---@param value any
---@return any
function triangle:set(key, value)
	if key == "PointA" then
		self.stored_point_a = value
	end

	if key == "PointB" then
		self.stored_point_b = value
	end

	if key == "PointC" then
		self.stored_point_c = value
	end

	if key == "Visible" then
		self.left_ward.Visible = value
		self.right_ward.Visible = value
	end

	if key == "ZIndex" then
		self.left_ward.ZIndex = value
		self.right_ward.ZIndex = value
	end

	if key == "Color" then
		self.left_ward.ImageColor3 = value
		self.right_ward.ImageColor3 = value
	end

	self:update()
end

---new triangle object
---@return triangle
function triangle.new()
	local self = setmetatable(roblox_drawing.new(), triangle)

	local instance_maid = maid.new()

	local tri_base = Instance.new("ImageLabel")
	tri_base.BackgroundTransparency = 1
	tri_base.AnchorPoint = Vector2.new(0.5, 0.5)
	tri_base.BorderSizePixel = 0

	local right_ward_inst = tri_base:Clone()
	right_ward_inst.Parent = self.screen_gui

	local right_ward = instance.add_instance(instance_maid, "right_ward", right_ward_inst)
	right_ward.Image = "rbxassetid://319692171"

	local left_ward_inst = tri_base:Clone()
	left_ward_inst.Parent = self.screen_gui

	local left_ward = instance.add_instance(instance_maid, "left_ward", left_ward_inst)
	left_ward.Image = "rbxassetid://319692151"

	self.instance_maid = instance_maid
	self.stored_point_a = Vector2.zero
	self.stored_point_b = Vector2.zero
	self.stored_point_c = Vector2.zero
	self.left_ward = left_ward
	self.right_ward = right_ward

	return self
end

-- return triangle module
return triangle
