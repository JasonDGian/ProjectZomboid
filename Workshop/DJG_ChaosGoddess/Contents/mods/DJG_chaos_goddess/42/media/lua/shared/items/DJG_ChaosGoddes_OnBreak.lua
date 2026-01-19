OnBreak = OnBreak or {}

function OnBreak.NecoArc(item)
    -- Get the player who is performing the action
    local player = getPlayer()

    if player then
        player:playSound("buranyuuu")
    else
        print("Error: No player detected in OnBreak.")
    end
end
