
function PlayCustomSound(player)
if player then
    player:playSound("knot")  -- sin ".ogg"
    end
end

-- Helper: Bind rope items for any recipe
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

    result:getModData()[modDataKey] = ropeItems

    PlayCustomSound(player)

end

-- Helper: Unbind rope items for any recipe
local function unbindRopeItems(items, player, modDataKey)
    local ropeItems = items:get(0):getModData()[modDataKey]

    if ropeItems == nil then
        player:getInventory():AddItem("Base.Rope")
    else
        for i = 1, #ropeItems do
            player:getInventory():AddItem(ropeItems[i])
        end
    end

    PlayCustomSound(player)

end

---------------------------------------------
------------- BINDING FUNCTIONS -------------
---------------------------------------------


-- PLANKS
function Recipe.OnCreate.BindPlanks(craftRecipeData, character)

    local items = craftRecipeData:getAllConsumedItems();
    local result = craftRecipeData:getAllCreatedItems():get(0);
    local player = character;

    bindRopeItems(items, result, "Base.Plank", "plankRopeItems", player)
end


-- SHEET METAL
function Recipe.OnCreate.BindSheetMetal(craftRecipeData, character)

    bindRopeItems(craftRecipeData:getAllConsumedItems(), craftRecipeData:getAllCreatedItems():get(0), "Base.SheetMetal", "sheetMetalRopeItems", character)

end

-- SMALL SHEET METAL
function Recipe.OnCreate.BindSmallSheetMetal(craftRecipeData, character)

    bindRopeItems(craftRecipeData:getAllConsumedItems(), craftRecipeData:getAllCreatedItems():get(0),  "Base.SmallSheetMetal", "smallSheetMetalRopeItems", character)

end

-- Tree Branches
function Recipe.OnCreate.BindTreeBranches(craftRecipeData, character)

    bindRopeItems(craftRecipeData:getAllConsumedItems(), craftRecipeData:getAllCreatedItems():get(0),  "Base.TreeBranch2", "treeBranchRopeItems", character)

end

-- Lead Pipes
function Recipe.OnCreate.BindLeadPipes(craftRecipeData, character)

    bindRopeItems(craftRecipeData:getAllConsumedItems(), craftRecipeData:getAllCreatedItems():get(0),  "Base.LeadPipe", "leadPipeRopeItems", character)

end

-- Metal Pipes
function Recipe.OnCreate.BindMetalPipes(craftRecipeData, character)

    bindRopeItems(craftRecipeData:getAllConsumedItems(), craftRecipeData:getAllCreatedItems():get(0),  "Base.MetalPipe", "metalPipeRopeItems", character)

end


---------------------------------------------
------------ UNBINDING FUNCTIONS ------------
---------------------------------------------

-- PLANKS
function Recipe.OnCreate.UnbindPlanks(craftRecipeData, character)

        local items = craftRecipeData:getAllConsumedItems();

        local player = character;

    unbindRopeItems(items, player, "plankRopeItems")
end

-- SHEET METAL
function Recipe.OnCreate.UnbindSheetMetal(craftRecipeData, character)

    unbindRopeItems(craftRecipeData:getAllConsumedItems(), character, "sheetMetalRopeItems")

end

-- SMALL SHEET METAL
function Recipe.OnCreate.UnbindSmallSheetMetal(craftRecipeData, character)

    unbindRopeItems(craftRecipeData:getAllConsumedItems(), character, "smallSheetMetalRopeItems")

end

-- TREE BRANCHES
function Recipe.OnCreate.UnbindTreeBranches(craftRecipeData, character)

    unbindRopeItems(craftRecipeData:getAllConsumedItems(), character, "treeBranchRopeItems")

end

-- TREE BRANCHES
function Recipe.OnCreate.UnbindLeadPipes(craftRecipeData, character)

    unbindRopeItems(craftRecipeData:getAllConsumedItems(), character, "leadPipeRopeItems")

end

-- TREE BRANCHES
function Recipe.OnCreate.UnbindMetalPipes(craftRecipeData, character)

    unbindRopeItems(craftRecipeData:getAllConsumedItems(), character, "metalPipeRopeItems")

end
