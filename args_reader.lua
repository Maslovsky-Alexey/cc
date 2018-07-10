
function readTriggers(args)
    if (#args < 3) then
        print("some args missed. please set 3 args 'left trigger index', 'right trigger index', 'finish trigger index'.")
        return false, nil
    end

    return true, { left = args[1], right = args[2], finish = args[3] }
end

return {
    readTriggers = readTriggers
}