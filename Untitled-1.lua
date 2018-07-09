turtle = {}
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
    rotate90right()
    turtle.select(getSlotIndexWithFood())
    turtle.place()
    rotate90right()
    move()
end

move()
move()

while true do
    oneStep()

    turtle.select(triggerBlockIndex)

    if (turtle.compare()) then
        return
    end
end







