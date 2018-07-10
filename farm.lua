local args = { ... }

tasks = { 'plant', 'harvest' } 

if (#args > 0 and args[1] == '-r') then 
  tasks = { 'harvest', 'plant' }
end

while true do
  shell.run(tasks[1], '14', '15', '16', '13')

  sleep(60 * 10)

  shell.run(tasks[2], '14', '15', '16', '13')
end