---@class RobloxDrawing
---@field ScreenGui ScreenGui
local RobloxDrawing = {}
RobloxDrawing.__index = RobloxDrawing

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.InstanceWrapper
local InstanceWrapper = require("Utility/InstanceWrapper")

-- Roblox drawing maid
---@note: We don't use it for any cleaning purposes, just to keep track of the instances & cache it.
local robloxDrawingMaid = Maid.new()

---Detach drawing.
function RobloxDrawing:detach() end

---Get field.
---@param key string
---@return any
function RobloxDrawing:get(key) end

---Set field.
---@param key string
---@param value any
---@return any
function RobloxDrawing:set(key, value) end

---Create new roblox drawing object.
---@return RobloxDrawing
function RobloxDrawing.new()
	local self = setmetatable({}, RobloxDrawing)
	self.screenGui =
		InstanceWrapper.create(robloxDrawingMaid, "RobloxDrawingHolder", "ScreenGui", game:GetService("CoreGui"))
	self.screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	self.screenGui.IgnoreGuiInset = true
	return self
end

-- Return RobloxDrawing module.
return RobloxDrawing
