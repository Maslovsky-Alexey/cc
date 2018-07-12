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
      turtle.drop(data.count)
    end

    if (tableContainsName(seeds, data.name)) then
      turtle.drop(data.count / 2)
    end
  end
end

dropItems()