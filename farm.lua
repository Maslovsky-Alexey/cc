os.loadAPI('harvest')
os.loadAPI('plant')

local args = { ... }

local triggers = {
  left = 14,
  right = 15,
  finish = 16,
  bone = 13
}

function plant()
  harvests.start(plant)
end

function harvest()
  harvests.start(triggers)
end

if (#args > 0 and args[1] == '-r') then 
  harvest()
end

while true do
  plant()

  sleep(60 * 10)

  harvest()
end
