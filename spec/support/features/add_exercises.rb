module Features
	def add_one_exercise(name, description)
		Exercise.create(name: name, description: description)
	end
end