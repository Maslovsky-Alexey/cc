os.loadAPI('movement')

function move()
    turtle.forward()
end

function addBoneIfNeed(triggers)
    turtle.select(triggers.bone)

    if (turtle.getItemCount() == 0) then
        return
    end

    while (turtle.place()) do end
end

function harvest(triggers)
    addBoneIfNeed(triggers)
    turtle.dig() 
    turtle.suck()
end

function step(triggers)
    harvest(triggers);
    move()
end

function turnStep(triggers, slotIndex, turn)
    if (not movement.compareBlock(slotIndex)) then
        return
    end

    turn()

    step(triggers)

    turn()
end

function start(triggers)
    while true do
        turnStep(triggers.right, turtle.turnRight)
        turnStep(triggers.left, turtle.turnLeft)

        step()

        if (movement.finish(triggers.finish)) then
            return
        end
    end
end

return {
    start = start
}