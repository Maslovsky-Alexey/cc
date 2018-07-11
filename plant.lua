os.loadAPI('movement')

function start(triggers)
    function move()
        turtle.forward()
    end

    function getSlotIndexWithFood()
        indexes = {}

        for i=1,4 do
            if (turtle.getItemCount(i) > 0) then 
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
        turn(triggers.right, turtle.turnRight, turtle.turnLeft)
        turn(triggers.left, turtle.turnLeft, turtle.turnRight)

        step()

        if (movement.finish(triggers.finish)) then
            return
        end
    end

end

return {
    start = start
}