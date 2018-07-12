local boneId = 'minecraft:dye'

function getBoneSlotIndex() 
    for i = 1,16 do
        turtle.select(i)

        result = turtle.getItemDetail()

        if (result.name == boneId) then
            return i
        end
    end

    return nil
end

function addBones()
    boneSlotIndex = getBoneSlotIndex()
    
    while (boneSlotIndex ~= nil and turtle.placeDown()) do
        boneSlotIndex = getBoneSlotIndex()
    end
end

function harvest()
    turtle.digDown() 
    turtle.suckDown()
end

return {
    harvest = harvest,
    addBones = addBones
}