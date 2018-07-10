local args = { ... }

tasks = { 'plant', 'harvest' } 

if (#args > 0 and args[1] == '-r') then 
  tasks = { 'harvest', 'plant' }
end

while true do
  os.run({14, 15, 16, 13}, tasks[1])

  sleep(60 * 10)

  os.run({14, 15, 16, 13}, tasks[2])
end