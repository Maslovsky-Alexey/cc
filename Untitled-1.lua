triggerBlockIndex = 16

function getSlotIndexWithFood()
    for i=1,16 do
        if (i ~= triggerBlockIndex and turtle.getItemCount(i) > 0) then 
            return i;
        end
    end

    return 1;
end

function rotate90right()
    turtle.turnRight()
    turtle.turnRight()
end

function move()
    turtle.forward()
end

function oneStep()
    move()

    rotate90right()

    turtle.dig()
    turtle.select(getSlotIndexWithFood())
    turtle.place()
    
    rotate90right()
end

function canMove()
    turtle.select(triggerBlockIndex)
    return turtle.compare()
end

move()

while true do
    if (~canMove()) then
        return
    end

    oneStep()
end







