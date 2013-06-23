require './todo_list'

# do stuff here

list = TodoList.new
list.add("dry cleaning")

if list.to_s == "0: dry cleaning\n"
  puts "OK: able to add an item"
else
  puts list.to_s
  throw "FAIL: not able to add an item"
end

puts "-----------------------------------"

list2 = TodoList.new
list.add("walk dog")
list.complete(0)

if list2.to_s == ""
  puts "OK: able to complete items"
else
  throw "FAIL: not able to complete an item"
end