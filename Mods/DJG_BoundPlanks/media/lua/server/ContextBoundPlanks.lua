-- Función para manejar el menú contextual de atar y desatar tablones

local function BoundPlanks_ContextMenu(player, context, items)
    local plankCount = 0
    local hasTwine = false
    local boundPlanks = nil
    local twineItem = nil

    for _, item in ipairs(items) do
        -- Verifica si el ítem tiene la propiedad items
        if item.items and item.items[1] then
            local fullItem = item.items[1]

            -- Verifica si el ítem seleccionado es BoundPlanks
            if fullItem:getType() == "BoundPlanks" then
                boundPlanks = fullItem
                print("Recuento atados: ", boundPlanks)
            end

            -- Cuenta la cantidad de tablones en el inventario
            if fullItem:getType() == "Base.Plank" then
                plankCount = plankCount + 1
            end

            -- Verifica si hay alguna cuerda en el inventario
            if  fullItem:getType() == "Base.SheetRope" or fullItem:getType() == "Base.Rope" then
                hasTwine = true
                twineItem = fullItem
            end
        end
    end

    -- Opción para desatar tablones
    if boundPlanks ~= nil then
        context:addOption("Desatar Tablones", boundPlanks, function()
            -- Acción para desatar los tablones

            player:getInventory():Remove(boundPlanks) -- Elimina BoundPlanks
            --player:getInventory():Remove(DJG_BoundPlanks.BoundPlanks)
            for i = 1, 10 do
                player:getInventory():AddItem("Base.Plank") -- Añade 10 tablones
            end
            player:getInventory():AddItem("Base.Rope") -- Añade 1 cuerda
        end)
    else
        print("Error: No se encontraron tablones unidos para desatar.")
    end

    -- Opción para atar tablones
    if plankCount >= 10 and hasTwine then
        context:addOption("Atar 10 Tablones", items, function()
            -- Acción para atar los tablones
            for i = 1, 10 do
                player:getInventory():Remove("Base.Plank") -- Elimina 10 tablones
            end
            print("Atando tablones")
            player:getInventory():Remove(twineItem) -- Elimina 1 cuerda
            player:getInventory():AddItem("BoundPlanks") -- Añade BoundPlanks
        end)
    else
        print("Error: No hay suficientes tablones o cuerda para atar.")
    end
end

-- Conecta el evento del menú contextual a la función
Events.OnFillInventoryObjectContextMenu.Add(BoundPlanks_ContextMenu)
