-- Function to handle crafting a "Plank Stack" item
-- It saves the types of rope items used in the crafting process

function Recipe.OnCreate.CreatePlankStack(items, result, player)
    local item, itemType
    local ropeItems = {}  -- Table to store rope types used in crafting

    -- Loop through all items used in the recipe
    for i = 0, items:size() - 1 do
        item = items:get(i)
        if item then
            itemType = item:getFullType()
            -- Only store non-Plank items (assumes rope or rope-like items)
            if itemType ~= "Base.Plank" then
                table.insert(ropeItems, itemType)
            end
        end
    end

    -- Save the rope items used into the result item's ModData
    result:getModData().ropeItems = ropeItems
end

-- Function to handle splitting the crafted "Plank Stack"
-- It returns the rope items that were used to make it
function Recipe.OnCreate.SplitPlankStack(items, result, player)
    -- Retrieve the saved rope items from the item's ModData
    local ropeItems = items:get(0):getModData().ropeItems

    -- If no ModData was saved, just give back a default rope
    if ropeItems == nil then
        player:getInventory():AddItem("Base.Rope")
    else
        -- Otherwise, return the exact rope items originally used
        for i = 1, #ropeItems do
            player:getInventory():AddItem(ropeItems[i])
        end
    end
end
