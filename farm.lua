local movement = os.loadAPI('movement')

trigers = { left = 14, right = 15, finish = 16 }

function getSlotIndexWithFood()
    indexes = {}

    for i=1,16 do
        if ((i ~= trigers.left and i ~= trigers.right and i ~= trigers.finish) and turtle.getItemCount(i) > 0) then 
            table.insert(indexes, i)
        end
    end

    return indexes[math.random(#indexes)]
end

function farm()
    turtle.dig()
    turtle.select(getSlotIndexWithFood())
    turtle.place()
end

movement.do(farm, trigers)