-- Function to play a custom sound when a recipe is completed.
function PlayCustomSound(player)
    if player then
        player:playSound("knot") -- Plays a custom sound named "knot.ogg"
    end
end

------------------------------------------------------------
-- Helper Functions: Handle the binding and unbinding of items with rope
------------------------------------------------------------

-- Binds items together with rope and stores their types in the result's modData.
-- This allows the game to remember which items were bound together.
-- @param items - The list of items used in the recipe
-- @param result - The resulting item after crafting
-- @param excludedItem - The item type to exclude from being stored
-- @param modDataKey - The key used to store the item types in modData
-- @param player - The player performing the crafting
local function bindRopeItems(items, result, excludedItem, modDataKey, player)
    local ropeItems = {}

    for i = 0, items:size() - 1 do
        local item = items:get(i)
        if item then
            local itemType = item:getFullType()
            if itemType ~= excludedItem then
                table.insert(ropeItems, itemType)
            end
        end
    end

    -- Store the bound item types in the resulting item
    result:getModData()[modDataKey] = ropeItems

    PlayCustomSound(player)
end

-- Unbinds items previously stored in modData and adds them back to the player's inventory.
-- If no modData exists, adds a rope as a fallback.
-- @param items - The items used in the unbinding recipe
-- @param player - The player performing the unbinding
-- @param modDataKey - The key where the original bound item types were stored
local function unbindRopeItems(items, player, modDataKey)
    local ropeItems = items:get(0):getModData()[modDataKey]

    print("items: ", items)
    print("player: ", player)
    print("modDataKey: ", modDataKey)

    if ropeItems == nil then
        -- Fallback: Add a rope if no items are stored
        player:getInventory():AddItem("Base.Rope")
    else
        -- Return each stored item type to the player's inventory
        for i = 1, #ropeItems do
            player:getInventory():AddItem(ropeItems[i])
        end
    end

    PlayCustomSound(player)
end

------------------------------------------------------------
-- Recipe OnCreate Functions: Called when recipes are crafted
------------------------------------------------------------

-- Plank Stack
function Recipe.OnCreate.BindPlanks(items, result, player)
    bindRopeItems(items, result, "Base.Plank", "plankRopeItems", player)
end

function Recipe.OnCreate.UnbindPlanks(items, result, player)
    unbindRopeItems(items, player, "plankRopeItems")
end

-- Sheet Metal
function Recipe.OnCreate.BindSheetMetal(items, result, player)
    bindRopeItems(items, result, "Base.SheetMetal", "sheetMetalRopeItems",
                  player)
end

function Recipe.OnCreate.UnbindSheetMetal(items, result, player)
    unbindRopeItems(items, player, "sheetMetalRopeItems")
end

-- Small Sheet Metal
function Recipe.OnCreate.BindSmallSheetMetal(items, result, player)
    bindRopeItems(items, result, "Base.SmallSheetMetal",
                  "smallSheetMetalRopeItems", player)
end

function Recipe.OnCreate.UnbindSmallSheetMetal(items, result, player)
    unbindRopeItems(items, player, "smallSheetMetalRopeItems")
end

-- Tree Branches
function Recipe.OnCreate.BindTreeBranches(items, result, player)
    bindRopeItems(items, result, "Base.TreeBranch", "treeBranchRopeItems",
                  player)
end

function Recipe.OnCreate.UnbindTreeBranches(items, result, player)
    unbindRopeItems(items, player, "treeBranchRopeItems")
end

-- Lead Pipes
function Recipe.OnCreate.BindLeadPipes(items, result, player)
    bindRopeItems(items, result, "Base.LeadPipe", "leadPipeRopeItems", player)
end

function Recipe.OnCreate.UnbindLeadPipes(items, result, player)
    unbindRopeItems(items, player, "leadPipeRopeItems")
end

-- Metal Pipes
function Recipe.OnCreate.BindMetalPipes(items, result, player)
    bindRopeItems(items, result, "Base.MetalPipe", "metalPipeRopeItems", player)
end

function Recipe.OnCreate.UnbindMetalPipes(items, result, player)
    unbindRopeItems(items, player, "metalPipeRopeItems")
end
