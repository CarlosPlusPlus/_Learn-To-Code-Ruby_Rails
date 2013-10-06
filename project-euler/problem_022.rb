# Problem 22
# Names Scores

def parse_names(path)
	file = File.open(path).read
	list = file.split(",").collect { |n| n.delete("\"") }
	list.sort
end

def name_score(name,index)
	name.bytes.inject(0) { |sum,b| sum + (b - 64) } * index
end

def list_score(names)
	scores = names.each_with_index.collect { |n,i| name_score(n,i+1) }
	scores.inject(:+)
end

names = parse_names('./_support/names.txt')
score = list_score(names)

puts "Total list score for names.txt = #{score}"