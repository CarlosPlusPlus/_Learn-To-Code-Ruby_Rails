def add(num1,num2)
	num1 + num2
end

def subtract(num1,num2)
	num1 - num2
end

def sum(array)
	array.empty? ? 0 : array.inject(:+)
end

def multiply(*array)
	array.empty? ? 0 : array.inject(:*)
end

def power(num1,num2)
	num1**num2
end

def factorial(num)
	return 1 if num <= 1
	num * factorial(num-1)
end