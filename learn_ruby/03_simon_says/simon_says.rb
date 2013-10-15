def echo(word)
	word
end

def shout(word)
	word.upcase
end

def repeat(word,number = 2)
	Array.new(number,word).join(" ")
end

def start_of_word(word,length)
	word[0..(length - 1)]
end

def first_word(string)
	string.split(" ").first
end

def titleize(title)
	words = title.split(" ")
	fixed_title = words.collect do |word|
		case word
			when "and","over", "the"
				word
			else
				word.capitalize
			end
	end

	fixed_title = fixed_title.join(" ")
	fixed_title[0] = fixed_title[0].upcase
	fixed_title
end