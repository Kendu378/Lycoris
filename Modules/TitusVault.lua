---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._when = 1450 / self.track.Speed
	action._type = "Forced Full Dodge"
	action.hitbox = Vector3.new(60, 110, 60)
	action.name = string.format("(%.2f) Dynamic Titus Timing", self.track.Speed)
	return self:action(timing, action)
end
