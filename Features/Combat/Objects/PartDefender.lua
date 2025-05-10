---@module Features.Combat.Objects.Defender
local Defender = require("Features/Combat/Objects/Defender")

---@module Game.Timings.SaveManager
local SaveManager = require("Game/Timings/SaveManager")

---@class PartDefender: Defender
---@field part BasePart
---@field timing PartTiming
---@field touched boolean Determines whether if we touched the timing in the past.
---@field finished boolean Determines whether if we finished the timing. This is used when we're doing timing delay instead of delay until in hitbox.
local PartDefender = setmetatable({}, { __index = Defender })
PartDefender.__index = PartDefender
PartDefender.__type = "Part"

-- Services.
local players = game:GetService("Players")

---Get CFrame.
---@note: Lag compensation of some kind? Maybe extrapolation.
---@param self PartDefender
---@return CFrame
PartDefender.cframe = LPH_NO_VIRTUALIZE(function(self)
	return self.timing.uhc and self.part.CFrame or CFrame.new(self.part.Position)
end)

---Check if we're in a valid state to proceed with the action.
---@param timing PartTiming
---@param action Action
---@return boolean
PartDefender.valid = LPH_NO_VIRTUALIZE(function(self, timing, action)
	if not Defender.valid(self, timing, action) then
		return false
	end

	local character = players.LocalPlayer.Character
	if not character then
		return self:notify(timing, "No character found.")
	end

	if not self:hc(self:cframe(), timing, action, { character }) then
		return false
	end

	return true
end)

---Update PartDefender object.
PartDefender.update = LPH_NO_VIRTUALIZE(function(self)
	-- Check if we're finished.
	if self.finished then
		return
	end

	-- Handle no hitbox delay.
	if not self.timing.duih then
		-- Clean all previous tasks.
		self:clean()

		-- Use module if we need to, else add actions.
		if self.timing.umoa then
			self:module(self.timing)
		else
			self:actions(self.timing)
		end

		-- Set that we're finished so we don't have to do this again.
		self.finished = true

		-- Return.
		return
	end

	-- Deny updates if we already have actions in the queue.
	if #self.tasks > 0 then
		return
	end

	local localPlayer = players.LocalPlayer
	if not localPlayer then
		return
	end

	local character = localPlayer.Character
	if not character then
		return
	end

	-- Get current hitbox state.
	---@note: If we're using PartDefender, why perserve rotation? It's likely wrong or gonna mess us up.
	local touching = self:hitbox(self:cframe(), false, self.timing.hitbox, { character })

	-- Deny updates if we're not touching the part.
	if not touching then
		return
	end

	-- Deny updates if the we were touching the part last and we are touching it now.
	if self.touched and touching then
		return
	end

	-- Ok, set the new state.
	self.touched = touching

	-- Clean all previous tasks. Just to be safe. We already check if it's empty... so.
	self:clean()

	-- Use module if we need to.
	if self.timing.umoa then
		return self:module(self.timing)
	end

	-- Add actions.
	return self:actions(self.timing)
end)

---Create new PartDefender object.
---@param part BasePart
---@return PartDefender?
function PartDefender.new(part)
	local self = setmetatable(Defender.new(), PartDefender)

	self.part = part
	self.timing = self:initial(part, SaveManager.ps, nil, part.Name)
	self.touched = false
	self.finished = false

	return self.timing and self or nil
end

-- Return PartDefender module.
return PartDefender
