<<-problem

Given a string consisting entirely of the characters '(' and ')'
in any random order, code a function that removes the sequence
of characters ")(" and returns the resulting string.

The returned string should never have the sequence of characters ")(" in it.  

problem

########################
# Function Definitions #
########################

def generate_test_string(max)
	Random.rand(0..max).times.collect { Random.rand(0..1) == 0 ? ")" : "(" }.join
end

def sanitize_string(sequence)
	return "\n\tOriginal string is empty - no need to sanitize!" if sequence.empty?

	prev_size = -1
	curr_size = sequence.size

	while prev_size != curr_size
		puts "Sanitization in progress: #{sequence}"

		prev_size = sequence.size()
		sequence  = sequence.gsub(/\)\(/, "")
		curr_size = sequence.size() 
	end

	sequence
end

##############
# Test Bench #
##############

puts "\nEnter max possible size for a randomly generated test string:\n"
max_size = gets.chomp.to_i

puts "\nEnter number of tests to run:\n"
num_test = gets.chomp.to_i

num_test.times do |count|
	puts "\n*** TEST #{count + 1} ***\n"
	puts "\nFinal sanitized string = #{sanitize_string(generate_test_string(max_size))}"
end

puts "\n!!! Testing completed. !!!\n\n"