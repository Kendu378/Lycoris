-- We have these ESP objects to handle:
-- Player
-- Mob
-- NPC
-- Chest
-- Area
-- JobBoard
-- Artifact
-- Whirlpool
-- Explosive
-- Owl
-- Door
-- Banner
-- Obelisk
-- Ingredient
-- Armor_Brick
-- Bell_Meteor
-- Rare_Obelisk
-- Heal_Brick
-- Mantra_Obelisk
-- BR_Weapon

---@module Utility.Maid
local Maid = require("Utility/Maid")

---@module Utility.Signal
local Signal = require("Utility/Signal")

---@module Visuals.Objects.BasicESP
local BasicESP = require("Visuals/Objects/BasicESP")

---@module Menu.VisualsTab
local VisualsTab = require("Menu/VisualsTab")

-- ESP module.
local ESP = {}

-- Services.
local runService = game:GetService("RunService")

-- Signals.
local renderStepped = Signal.new(runService.RenderStepped)
local gameDescendantAdded = Signal.new(game.DescendantAdded)
local gameDescendantRemoving = Signal.new(game.DescendantRemoving)

-- Maids.
local espMaid = Maid.new()

-- Objects.
local espObjects = {}

-- Constants.
local ESP_DISTANCE_FORMAT = "%s [%i]"

-- Chest ESP name callback.
---@param self BasicESP
local function chestESPNameCallback(self)
	if Toggles[VisualsTab.identify(self.identifier, "Distance")].Value then
		return ESP_DISTANCE_FORMAT:format("Chest", self.distance)
	else
		return "Chest"
	end
end

-- Update ESP.
local function updateESP()
	for _, espObject in pairs(espObjects) do
		espObject:update()
	end
end

-- On descendant added.
---@param descendant Instance
local function onDescendantAdded(descendant)
	if descendant:FindFirstChild("LootUpdated") then
		espObjects[descendant] = BasicESP.new("Chest", descendant, chestESPNameCallback)
	end
end

-- On descendant removing.
---@param descendant Instance
local function onDescendantRemoving(descendant)
	if not espObjects[descendant] then
		return
	end

	espObjects[descendant]:detach()
	espObjects[descendant] = nil
end

-- Initialize ESP.
function ESP.init()
	espMaid:add(renderStepped:connect("ESP_RenderStepped", updateESP))
	espMaid:add(gameDescendantAdded:connect("ESP_DescendantAdded", onDescendantAdded))
	espMaid:add(gameDescendantRemoving:connect("ESP_DescendantRemoving", onDescendantRemoving))
end

-- Detach ESP.
function ESP.detach()
	espMaid:clean()

	for _, espObject in pairs(espObjects) do
		espObject:detach()
	end
end

-- Return ESP module.
return ESP
