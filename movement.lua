function rotate90right()
    turtle.turnRight()
    turtle.turnRight()
end

function rotate90left()
    turtle.turnLeft()
    turtle.turnLeft()
end

function move()
    turtle.forward()
end

function oneStep(action)
    move()

    rotate90right()

    action();

    rotate90right()
end

function turnStep(slotIndex, left, right)
    turtle.select(slotIndex)
    
    if (not turtle.compare()) then
        return false
    end

    right()
    move()

    right()
    right()

    farm()

    left()

    return true 
end

function finish(finishSlotIndex)
    turtle.select(finishSlotIndex)

    result = turtle.compareDown()

    if (result) then 
        rotate90left()
    end

    return result
end

local movement = {}

function movement.do(action, trigers)
    trigers = trigers
    
    move()

    while true do
        turnStep(trigers.right, turtle.turnLeft, turtle.turnRight)
        turnStep(trigers.left, turtle.turnRight, turtle.turnLeft)
    
        oneStep(action)
    
        if (finish(trigers.finish)) then
            return
        end
    end
end

return movement