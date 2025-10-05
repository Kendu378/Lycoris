---@type Action
local Action = getfenv().Action

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local action = Action.new()
	action._when = 350
	action._type = "Parry"
	action.hitbox = Vector3.new(40, 40, 40)
	action.name = "(1) Shared Servants Timing"
	self:action(timing, action)

	local secondAction = Action.new()
	secondAction._when = 700
	secondAction._type = "Parry"
	secondAction.hitbox = Vector3.new(40, 40, 40)
	secondAction.name = "(2) Shared Servants Timing 2"
	return self:action(timing, secondAction)
end
