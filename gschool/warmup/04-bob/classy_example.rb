class Bob
  def chat(input)
    puts response_for(input)
  end

  def response_for(input)
    if shouting?(input)
      'Woah, chill out!'
    elsif question?(input)
      'Sure.'
    elsif statement?(input)
      'Whatever.'
    else
      'Fine, be that way.'
    end
  end

  def statement?(input)
    input.length > 0
  end

  def question?(input)
    input.end_with?("?")
  end

  def shouting?(input)
    !input.empty? && input == input.upcase
  end
end

if ENV["RUBY_ENV"] == "test"
else
  puts "Hey bro, wassup?"
  bob = Bob.new
  while true
    input = gets.chomp.strip
    bob.chat(input)
  end
end