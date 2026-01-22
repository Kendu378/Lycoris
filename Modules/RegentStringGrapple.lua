---@type Action
local Action = getfenv().Action

---Module function.
---@param self EffectDefender
---@param timing EffectTiming
return function(self, timing)
	local distance = self:distance(self.owner)

	local action = Action.new()
	action._when = 0
	action._type = "Parry"
	action.hitbox = Vector3.new(25, 28, 25)
	action.name = string.format("(%.2f) Regent String Grapple Timing", distance)
	return self:action(timing, action)
end
