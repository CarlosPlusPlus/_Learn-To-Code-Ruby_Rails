require './todo'

class TodoList
  def initialize
    @todos = []
  end

  def add(title)
    todo = Todo.new(title)
    @todos << todo
  end

  def complete(index)
    @todos.delete_at(index)
  end

  def to_s
    print = ''
    @todos.each_with_index do |item, i|
      print << "#{i}: #{item.title}\n"
    end
    print
  end
end
