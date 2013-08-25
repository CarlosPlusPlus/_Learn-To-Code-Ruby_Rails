class HappyBirthday

  attr_reader :today
  def initialize(today = Date.today)
    @today = today
  end

  def congratulations
    year = ask("What year were you born?")
    month = ask("What month were you born? Make it a number, please)")
    day = ask("What day of the month were you born?")
    spanks(year, month, day).times do
      puts "SPANK"
    end
  end

  def ask(question)
    print "#{question} >"
    gets.chomp.to_i
  end

  def age(year, month, day)
    date_of_birth = Date.new(year, month, day)
    this_year = today.year
    age_in_years = this_year - year
    if today < Date.new(this_year, month, day)
      age_in_years -= 1
    end
    age_in_years
  end
end
