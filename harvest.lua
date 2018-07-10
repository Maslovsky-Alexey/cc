os.loadAPI('movement')
os.loadAPI('args_reader')

local args = { ... }

result, trigers = args_reader.readTriggers(args)

if (not result) then
    return
end

function move()
    turtle.forward()
end

function harvest()
    turtle.attack() 
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

    harvest()

    step()

    turn()
end

function finish()
    if (movement.isFinish(trigers.finish)) then
        movement.rotate90left()
        return true
    end

    return false
end

while true do
    turn(trigers.right, turtle.turnRight)
    turn(trigers.left, turtle.turnLeft)

    step()

    if (movement.finish()) then
        return
    end
end