class Friend
	def greeting(person = nil)
		person.nil? ? "Hello!" : "Hello, #{person}!"
	end
end