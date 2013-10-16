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
	fixed_title = title.split(" ").collect do |word|
		["and","over","the"].include?(word) ? word : word.capitalize
	end.join(" ")
	fixed_title[0].upcase + fixed_title[1..-1]
end