function rotate90right()
    turtle.turnRight()
    turtle.turnRight()
end

function rotate90left()
    turtle.turnLeft()
    turtle.turnLeft()
end

function compareBlock(slotIndex)
    turtle.select(slotIndex)
    
    return turtle.compare()
end

function isFinish(finishSlotIndex)
    turtle.select(finishSlotIndex)
    
    return turtle.compareDown()
end

function finish()
    if (movement.isFinish(trigers.finish)) then
        movement.rotate90left()
        return true
    end

    return false
end

return {
    rotate90right = rotate90right,
    rotate90left = rotate90left,
    compareBlock = compareBlock,
    finish = finish
}