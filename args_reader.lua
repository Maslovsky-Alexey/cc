function toNumber(str)
    return str + 0
end

function readTriggers(args)
    if (#args < 4) then
        print("some args missed. please set 3 args 'bone trigger index', 'left trigger index', 'right trigger index', 'finish trigger index'.")
        return false, nil
    end

    return true, { left = toNumber(args[1]), right = toNumber(args[2]), finish = toNumber(args[3]), bone = toNumber(args[4]) }
end

return {
    readTriggers = readTriggers
}