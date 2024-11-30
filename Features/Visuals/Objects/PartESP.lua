---@module Features.Visuals.Objects.PositionESP
local PositionESP = require("Features/Visuals/Objects/PositionESP")

---@note: Optimization - we assume the part coming in is an actual part.
---@class PartESP: PositionESP
---@field part Part
local PartESP = setmetatable({}, { __index = PositionESP })
PartESP.__index = PartESP

---Update PartESP.
---@param tags string[]
function PartESP:update(tags)
	local part = self.part

	if not part.Parent then
		return self:hide()
	end

	PositionESP.update(self, part.Position, tags or {})
end

---Create new PartESP object.
---@param identifier string
---@param part Part
---@param label string
function PartESP.new(identifier, part, label)
	if not part:IsA("BasePart") then
		return error(string.format("PartESP expected part on %s creation.", identifier))
	end

	local self = setmetatable(PositionESP.new(identifier, label), PartESP)
	self.part = part
	return self
end

-- Return PartESP module.
return PartESP
