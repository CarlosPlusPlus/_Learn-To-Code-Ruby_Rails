<<-problem
	Flatten an array without using the flatten method.
problem

def flatten(array)
	return [array] if array.is_a?(Fixnum) || array.is_a?(String)
	array.collect{|n| flatten(n) }.inject(:+)
end

puts flatten([0,[1,2],[[[3]]],4,[5,6]]).inspect
puts flatten([0,[1,[2,3,[4,5,6],[7,8,9,[10,11,[12]]]]]]).inspect
puts flatten([0,["one",[2,"three",[4,"five","six"],["seven",8,9,[10,"eleven",[12]]]]]]).inspect