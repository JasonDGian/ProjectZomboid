-------------------------------------------------
-- DJG Bound Materials - Build 42 Safe Version --
-------------------------------------------------

-------------------------------------------------
-- SAFETY INITIALIZATION (B42 REQUIRED)
-------------------------------------------------
Recipe = Recipe or {}
Recipe.OnCreate = Recipe.OnCreate or {}

-------------------------------------------------
-- SOUND
-------------------------------------------------
local function PlayCustomSound(player)
    if player then
        player:playSound("knot") -- sin ".ogg"
    end
end

-------------------------------------------------
-- HELPER: Bind rope items
-------------------------------------------------
local function bindRopeItems(items, result, excludedItem, modDataKey, player)
    if not result then
        print("ERROR: bindRopeItems result is nil for key " .. tostring(modDataKey))
        return
    end

    local modData = result:getModData()
    if not modData then
        print("ERROR: result:getModData() returned nil")
        return
    end

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

    modData[modDataKey] = ropeItems
    PlayCustomSound(player)
end

-------------------------------------------------
-- HELPER: Unbind rope items
-------------------------------------------------
local function unbindRopeItems(items, player, modDataKey)
    if not items or items:size() == 0 then
        print("ERROR: unbindRopeItems items table is empty.")
        return
    end

    local first = items:get(0)
    if not first then
        print("ERROR: unbindRopeItems first item is nil.")
        return
    end

    local modData = first:getModData() or {}
    local ropeItems = modData[modDataKey]

    if ropeItems == nil then
        if player then
            player:getInventory():AddItem("Base.Rope")
        end
    else
        for i = 1, #ropeItems do
            if player then
                player:getInventory():AddItem(ropeItems[i])
            end
        end
    end

    PlayCustomSound(player)
end

-------------------------------------------------
-- BINDING FUNCTIONS
-------------------------------------------------

function Recipe.OnCreate.BindPlanks(craftRecipeData, character)
    bindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        craftRecipeData:getAllCreatedItems():get(0),
        "Base.Plank",
        "plankRopeItems",
        character
    )
end

function Recipe.OnCreate.BindSheetMetal(craftRecipeData, character)
    bindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        craftRecipeData:getAllCreatedItems():get(0),
        "Base.SheetMetal",
        "sheetMetalRopeItems",
        character
    )
end

function Recipe.OnCreate.BindSmallSheetMetal(craftRecipeData, character)
    bindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        craftRecipeData:getAllCreatedItems():get(0),
        "Base.SmallSheetMetal",
        "smallSheetMetalRopeItems",
        character
    )
end

function Recipe.OnCreate.BindTreeBranches(craftRecipeData, character)
    bindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        craftRecipeData:getAllCreatedItems():get(0),
        "Base.TreeBranch2",
        "treeBranchRopeItems",
        character
    )
end

function Recipe.OnCreate.BindLeadPipes(craftRecipeData, character)
    bindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        craftRecipeData:getAllCreatedItems():get(0),
        "Base.LeadPipe",
        "leadPipeRopeItems",
        character
    )
end

function Recipe.OnCreate.BindMetalPipes(craftRecipeData, character)
    bindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        craftRecipeData:getAllCreatedItems():get(0),
        "Base.MetalPipe",
        "metalPipeRopeItems",
        character
    )
end

function Recipe.OnCreate.BindMetalBars(craftRecipeData, character)
    bindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        craftRecipeData:getAllCreatedItems():get(0),
        "Base.MetalBar",
        "metalBarRopeItems",
        character
    )
end
function Recipe.OnCreate.BindWoodenRod(craftRecipeData, character)
    bindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        craftRecipeData:getAllCreatedItems():get(0),
        "Base.WoodenStick2",
        "woodenRodRopeItems",
        character
    )
end
function Recipe.OnCreate.BindTwigs(craftRecipeData, character)
    bindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        craftRecipeData:getAllCreatedItems():get(0),
        "Base.Twigs",
        "twigsRopeItems",
        character
    )
end

-------------------------------------------------
-- UNBINDING FUNCTIONS
-------------------------------------------------

function Recipe.OnCreate.UnbindPlanks(craftRecipeData, character)
    unbindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        character,
        "plankRopeItems"
    )
end

function Recipe.OnCreate.UnbindSheetMetal(craftRecipeData, character)
    unbindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        character,
        "sheetMetalRopeItems"
    )
end

function Recipe.OnCreate.UnbindSmallSheetMetal(craftRecipeData, character)
    unbindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        character,
        "smallSheetMetalRopeItems"
    )
end

function Recipe.OnCreate.UnbindTreeBranches(craftRecipeData, character)
    unbindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        character,
        "treeBranchRopeItems"
    )
end

function Recipe.OnCreate.UnbindLeadPipes(craftRecipeData, character)
    unbindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        character,
        "leadPipeRopeItems"
    )
end

function Recipe.OnCreate.UnbindMetalPipes(craftRecipeData, character)
    unbindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        character,
        "metalPipeRopeItems"
    )
end

function Recipe.OnCreate.UnbindMetalBars(craftRecipeData, character)
    unbindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        character,
        "metalBarRopeItems"
    )
end

function Recipe.OnCreate.UnbindWoodenRod(craftRecipeData, character)
    unbindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        character,
        "woodenRodRopeItems"
    )
end

function Recipe.OnCreate.UnbindTwigs(craftRecipeData, character)
    unbindRopeItems(
        craftRecipeData:getAllConsumedItems(),
        character,
        "twigsRopeItems"
    )
end