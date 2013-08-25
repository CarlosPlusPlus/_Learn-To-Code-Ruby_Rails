class School

  attr_reader :db
  def initialize(name)
    @db = {}
  end

  def add(student, grade)
    db[grade] ||= []
    db[grade] << student
  end

  def grade(level)
    db[level] || []
  end

  def sort
    sorted = db.sort_by {|grade, students| students.sort!; grade}
    Hash.new(sorted)
  end
end
