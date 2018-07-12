seedIds = { 'minecraft:carrot', 'minecraft:patato', 'minecraft:wheat_seeds' }

function isSlotWithSeeds(index)
    turtle.select(index)

    info = turtle.getItemDetail()

    if (info == nil) then
        return false
    end

    for i,x in pairs(seedIds) do
        if (info.name == x) then 
            return true
        end
    end

    return false
end

function getSlotIndexWithSeeds()
    indexes = {}

    for i=1,16 do
        if (isSlotWithSeeds(i)) then 
            table.insert(indexes, i)
        end
    end

    return indexes[math.random(#indexes)]
end

function plant()
    turtle.digDown()
    turtle.select(getSlotIndexWithSeeds())
    turtle.placeDown()
end

return {
    plant = plant
}