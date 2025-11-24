---@type PartTiming
local PartTiming = getfenv().PartTiming

---@type Action
local Action = getfenv().Action

---@type Signal
local Signal = getfenv().Signal

---@module Utility.TaskSpawner
local TaskSpawner = getfenv().TaskSpawner

---@module Features.Combat.Defense
local Defense = getfenv().Defense

---@module Game.Latency
local Latency = getfenv().Latency

---Combined module for IceDaggers & FleetingSparks
---@param self AnimatorDefender
---@param timing AnimationTiming
return function(self, timing)
	local thrown = workspace:FindFirstChild("Thrown")
	if not thrown then
		return
	end

	-- Track either IceDagger or FleetingSparks
	local tracker = ProjectileTracker.new(function(candidate)
		return candidate and candidate.Name and (candidate.Name == "IceDagger" or candidate.Name == "LightningMote")
	end)

	task.wait(0.5 - Latency.rtt())

	local hrp = self.entity:FindFirstChild("HumanoidRootPart")
	if not hrp then
		return
	end

	local thread = TaskSpawner.spawn("ProjectileWaiter", function()
		local projectile = tracker:wait()
		if not projectile or not projectile:IsA("BasePart") then
			return
		end

		local name = projectile.Name

		-- === FleetingSparks logic ===
		if name == "LightningMote" then
			if self:distance(self.entity) <= 10 then
				local actionclose = Action.new()
				actionclose._type = "Parry"
				actionclose._when = 0
				actionclose.name = "Fleeting Sparks Close Timing"
				actionclose.ihbc = true
				return self:action(timing, actionclose)
			end

			local action = Action.new()
			action._when = 0
			action._type = "Parry"
			action.name = "Fleeting Sparks Part"

			local pt = PartTiming.new()
			pt.uhc = false
			pt.duih = true
			pt.fhb = false
			pt.name = "FleetingSparksProjectile"
			pt.actions:push(action)
			pt.cbm = true

			pt.hitbox = Vector3.new(10, 10, 10)
			Defense.cdpo(projectile, pt)

			local baseHitbox = Vector3.new(10, 10, 10)
			local lastSpeed = 0
			local smoothing = 0.3 -- 0.1–0.3 recommended: lower = snappier, higher = smoother

			while task.wait() do
				if not projectile or not projectile.Parent then
					break
				end

				local velocity = projectile.AssemblyLinearVelocity or projectile.Velocity or Vector3.zero
				local rawSpeed = velocity.Magnitude

				-- smooth speed using exponential moving average
				local smoothedSpeed = lastSpeed + (rawSpeed - lastSpeed) * smoothing
				lastSpeed = smoothedSpeed

				-- compute scale factor (smoothly changing)
				local scaleFactor = math.clamp(smoothedSpeed / 5, 1, 4)
				local newHitbox = baseHitbox * scaleFactor

				pt.hitbox = newHitbox
			end
		-- === IceDaggers logic ===
		elseif name == "IceDagger" then
			while task.wait() do
				if not projectile or not projectile.Parent then
					break
				end

				local distance = self:distance(projectile)
				if distance >= 20 then
					continue
				end

				local action = Action.new()
				action._when = 0
				action.ihbc = true
				action._type = "Parry"
				action.name = string.format("(%.2f) Ice Daggers Timing", distance)
				return self:action(timing, action)
			end
		end
	end)

	local onDescendantAdded = Signal.new(self.entity.DescendantAdded)

	self.tmaid:add(onDescendantAdded:connect("IceDaggersClose", function(child)
		if child.Name ~= "REP_SOUND_5033484755" then
			return
		end

		local distance = self:distance(self.entity)
		if distance > 30 then
			return
		end

		-- Cancel thread.
		task.cancel(thread)

		-- Parry close.
		local action = Action.new()
		action.ihbc = true
		action._type = "Parry"
		action.name =
			string.format("(%.2f) (%.2f) Ice Daggers Close Timing", distance, hrp.AssemblyLinearVelocity.Magnitude)

		if distance <= 10 then
			action._when = 100
		end

		if distance > 10 or hrp.AssemblyLinearVelocity.Magnitude > 20 then
			action._when = 400
		end

		return self:action(timing, action)
	end))

	self.tmaid:add(thread)
end
