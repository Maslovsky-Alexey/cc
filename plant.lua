os.loadAPI('movement')
os.loadAPI('args_reader')

local args = { ... }

result, triggers = args_reader.readTriggers(args)

if (not result) then
    return
end

function move()
    turtle.forward()
end

function getSlotIndexWithFood()
    indexes = {}

    for i=1,16 do
        if ((i ~= triggers.left and i ~= triggers.right and i ~= triggers.finish) and turtle.getItemCount(i) > 0) then 
            table.insert(indexes, i)
        end
    end

    return indexes[math.random(#indexes)]
end

function plant()
    turtle.dig()
    turtle.select(getSlotIndexWithFood())
    turtle.place()
end

function step()
    move()

    movement.rotate90right()

    plant();

    movement.rotate90right()
end

function turn(slotIndex, turn, turnBack)
    if (not movement.compareBlock(slotIndex)) then
        return
    end

    turn()
    move()

    turn()
    turn()

    plant()

    turnBack()
end

move()

while true do
    turn(triggers.right, turtle.turnLeft, turtle.turnRight)
    turn(triggers.left, turtle.turnRight, turtle.turnLeft)

    step()

    if (movement.finish(triggers.finish)) then
        return
    end
end