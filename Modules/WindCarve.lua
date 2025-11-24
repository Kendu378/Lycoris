---@class Action
local Action = getfenv().Action

---@module Modules.Globals.Mantra
local Mantra = getfenv().Mantra

---@class Signal
local Signal = getfenv().Signal

---Module function.
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local data = Mantra.data(self.entity, "Mantra:CarveWind{{Wind Carve}}")
	local range = data.stratus * 1.4 + data.cloud * 0.9

	timing.ffh = true
	timing.pfh = true
	timing.fhb = true
	timing.rpue = false

	local action = Action.new()
	action._when = 400
	action._type = "Start Block"
	action.hitbox = Vector3.new(18 + range, 15 + range, 15 + range)
	action.name = "Wind Carve Start"
	self:action(timing, action)

	local hrp = self.entity:FindFirstChild("HumanoidRootPart")
	if not hrp then
		return
	end

	local onDescendantAdded = Signal.new(self.entity.DescendantAdded)

	self.tmaid:add(onDescendantAdded:connect("WindCarve_StopCarve", function(child)
		if child.Name == "StopCarve" then
			local actionTwo = Action.new()
			actionTwo._when = 0
			actionTwo._type = "End Block"
			actionTwo.ihbc = true
			actionTwo.name = "Wind Carve End"
			self:action(timing, actionTwo)
		end
	end))
end
