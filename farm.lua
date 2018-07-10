local args = { ... }

tasks = (#args > 0 and args[1] == '-r') ? { 'harvest', 'plant' } : { 'plant', 'harvest' } 

while true do
  os.run(tasks[1])

  sleep(60 * 10)

  os.run(tasks[2])
end