---@class Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	timing.duih = true
	timing.hitbox = Vector3.new(30, 30, 30)
	timing.mat = 2000
	timing.iae = true

	local action = Action.new()
	action._when = self.track.Speed <= 1.5 and 1100 or 900
	action._type = "Parry"
	action.hitbox = Vector3.new(100, 100, 100)
	action.name = string.format("(%.2f) Relentless Silentheart Timing", self.track.Speed)
	self:action(timing, action)
end
