---@class Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	timing.mat = 2000
	timing.iae = true
	timing.ndfb = true
	timing.duih = false

	repeat
		task.wait()
	until self.track.Speed <= 0.0

	local action = Action.new()
	action._when = 0
	action._type = "Parry"
	action.hitbox = Vector3.new(100, 100, 100)
	action.name = string.format("(%.2f) Dynamic Relentless SH Timing", self.track.TimePosition)
	return self:action(timing, action)
end
