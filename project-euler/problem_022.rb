# Problem 22
# Names Scores

require 'awesome_print'

def parse_names(path)
	file = File.open(path).read
	file.split(",").collect { |n| n.delete("\"") }
end

names = parse_names('./_support/names.txt')
ap names