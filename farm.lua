local args = { ... }

function plant()
  shell.run(tasks[1], '14', '15', '16', '13')
end

function harvest()
  shell.run(tasks[2], '14', '15', '16', '13')
end

if (#args > 0 and args[1] == '-r') then 
  harvest()
end

while true do
  plant()

  sleep(60 * 10)

  harvest()
end
