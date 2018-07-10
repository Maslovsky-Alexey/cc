trigers = { left = 14, right = 15, finish = 16 }

function getSlotIndexWithFood()
    for i=1,16 do
        if ((i ~= trigers.left and i ~= trigers.right and i ~= trigers.finish) and turtle.getItemCount(i) > 0) then 
            return i;
        end
    end

    return 1;
end

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

function farm()
    turtle.dig()
    turtle.select(getSlotIndexWithFood())
    turtle.place()
end

function oneStep()
    move()

    rotate90right()

    farm()

    rotate90right()
end

function canMove()
    turtle.select(triggerBlockIndex)
    return not turtle.compare()
end

function turnRightIfNeed()
    turtle.select(trigers.right)
    
    if (not turtle.compare()) then
        return false
    end

    turtle.turnRight()
    move()

    rotate90right()

    farm()

    turtle.turnLeft()

    return true 
end

function turnLeftIfNeed()
    turtle.select(trigers.left)
    
    if (not turtle.compare()) then
        return false
    end

    turtle.turnLeft()
    move()

    rotate90right()

    farm()

    turtle.turnRight()

    return true 
end

function finish()
    turtle.select(trigers.finish)

    result = turtle.compare()

    if (result) then 
        rotate90left()
    end

    return result
end

move()

while true do
    turnRightIfNeed()
    turnLeftIfNeed()

    oneStep()

    if (finish()) then
        return
    end
end







