os.loadAPI('harvest_lib')
os.loadAPI('plant_lib')

local growthMetadata = 7 

function isGrown()
    success, result = turtle.inspectDown()

    return result.metadata == growthMetadata
end

function isPlant()
  success, result = turtle.inspectDown()

  return result.metadata ~= nil
end

function turnLeft()
  turtle.turnLeft()
  turtle.forward()
  turtle.turnLeft()
end

function turnRight()
  turtle.turnRight()
  turtle.forward()
  turtle.turnRight()
end

function justTurnRight()
  turtle.turnRight()
end

function tableContainsName(table, name)
  for j=1, #table do
    if (data.name == table[i]) then
      return true
    end
  end

  return false
end

function dropItems()
  itemsToDrop = { 'minecraft:wheat' }
  seeds = { 'minecraft:carrot', 'minecraft:potato' }

  for i=1,16 do
    turtle.select(i)
    data = turtle.getItemDetail()

    if (tableContainsName(itemsToDrop, data.name)) then
      turtle.drop(turtle.getItemCount())
    end

    if (tableContainsName(seeds, data.name)) then
      turtle.drop(turtle.getItemCount() / 2)
    end
  end
end

function finish()
  turtle.turnLeft()
  
  dropItems()

  turtle.turnRight()
  turtle.turnRight()

  sleep(5)
end

local triggers = {
  {name = 'minecraft:stone', action = turnLeft},
  {name = 'minecraft:wool', action = turnRight},
  {name = 'minecraft:dirt', action = finish},
  {name = 'minecraft:leaves', action = justTurnRight}
}

function move()
  s, r = turtle.inspect()

  if (r ~= nil) then
    for i = 1, #triggers do
      if (triggers[i].name == r.name) then
        triggers[i].action()
        return
      end
    end
  end

  turtle.forward()
end

while true do
  move()

  if (isGrown()) then
    harvest_lib.harvest()
  end

  if (not isPlant()) then
    plant_lib.plant()
  end
end