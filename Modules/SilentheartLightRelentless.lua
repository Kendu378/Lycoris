---@class Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	timing.duih = true
	timing.hitbox = Vector3.new(40, 40, 40)
	timing.mat = 1000
	timing.iae = true

	local action = Action.new()
	action._when = 1100

	if self.track.Speed <= 1.3 then
		action._when = 1200
	end

	if self.track.Speed <= 1.1 then
		action._when = 1300
	end

	if self.track.Speed >= 1.5 then
		action._when = 1000
	end

	action._type = "Parry"
	action.hitbox = Vector3.new(30, 30, 30)
	action.name = string.format("(%.2f) Relentless Silentheart Timing", self.track.Speed)
	self:action(timing, action)
end
