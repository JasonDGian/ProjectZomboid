-- The event handler function
-- This is the function that is hooked to play the random sound.
local function onHitSomethingDJG(player, zombie, weapon)

    -- List of sound files for the custom weapon hit sounds
    local randomSounds = {
        "NecoHitSound", "NecoHitSound2", "NecoHitSound3", "NecoHitSound4",
        "NecoHitSound5", "NecoHitSound6", "NecoHitSound7", "NecoHitSound8",
        "NecoHitSound9", "NecoHitSound10"
    }

    -- Check if the weapon is valid
    if weapon then
        -- Safely handle concatenation and check for a valid weapon type
        local weaponType = weapon:getType() or "Unknown weapon type"
        --print("Weapon type: ", weaponType) -- Print the weapon type for debugging

        -- Only proceed if the weapon is NecoArcFigure
        if weaponType == "NecoArcFigure" then
            --print("Hit with NecoArcFigure weapon!")

            -- Pick a random sound from the list
            local randomIndex = ZombRand(#randomSounds) + 1
            local soundName = randomSounds[randomIndex]

            -- Debugging: Print the chosen sound name
            --print("Chosen sound: " .. soundName)

            -- Play the sound for the player
            if soundName then

                -- First version
                --print("Playing sound: " .. soundName) -- Debugging: Confirm sound is being played
                player:playSound(soundName)

                -- Less efficient version for more control.
                --local emitter = getWorld():getFreeEmitter()
                --emitter:setPos(player:getX(), player:getY(), player:getZ())

                -- Play the sound
                --emitter:playSound(soundName)

                -- Adjust volume here (0.0 = mute, 1.0 = full volume)
                --emitter:setVolume(0.4)  -- Example: 40% volume

            else
                print("Error: No sound selected.")
            end
        else
            print("Weapon is not NecoArcFigure, no sound will be played.")
        end
    else
        print("Error: Weapon is nil.")
    end
end

-- Attach the event handler to OnWeaponHitCharacter
if Events.OnWeaponHitCharacter then
    Events.OnWeaponHitCharacter.Add(onHitSomethingDJG)
    print("Listener added to OnWeaponHitCharacter for DJG Chaos Goddess.")
else
    print(
        "Failed to add listener: OnWeaponHitCharacter is nil for DJG Chaos Goddess.")
end
