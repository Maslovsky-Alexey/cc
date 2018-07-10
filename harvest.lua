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

function addBoneIfNeed()
    turtle.select(triggers.bone)

    if (turtle.getItemCount() = 0) then
        return
    end

    while (turtle.place()) do end
end

function harvest()
    addBoneIfNeed()
    turtle.dig() 
    turtle.suck()
end

function step()
    harvest();
    move()
end

function turn(slotIndex, turn)
    if (not movement.compareBlock(slotIndex)) then
        return
    end

    turn()

    step()

    turn()
end

while true do
    turn(triggers.right, turtle.turnRight)
    turn(triggers.left, turtle.turnLeft)

    step()

    if (movement.finish(triggers.finish)) then
        return
    end
end