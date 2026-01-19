-------------------------------------------------
-- DJG Chaos Goddes - Build 42 Safe Version --
-------------------------------------------------
Recipe = Recipe or {}
Recipe.OnCreate = Recipe.OnCreate or {}
CraftRecipeCode = CraftRecipeCode or {};

function CraftRecipeCode.NecoGreetSound(craftProcessor, player)
    print("DEBUG: craftProcessor=", craftProcessor, " player=", player)

    if player then
        player:playSound("buranyuuu")
    else
        print("ERROR: Player is nil in NecoGreetSound")
    end
end


