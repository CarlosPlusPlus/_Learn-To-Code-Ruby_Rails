class Player

	#########################
	# Player Initialization #
	#########################

	def initialize
		@action_taken 	= false		# Did I take my action?
		@in_combat			= false		# Am I in combat?
		@space_state		= false		# Is the space empty?
		@warrior_health	= 20			# What is my health?
	end


	# List of possible warrior actions.
	Actions = [:sense_environment,
						 :check_health,
						 :attack_monster,
						 :move_warrior]

	##################
	# Helper Methods #
	##################

	def sense_environment
		@action_taken		= false		# Reset environment.
		@space_state		= @warrior.feel.empty?
		@warrior_health	= @warrior.health

		# No longer in combat.
		@in_combat = false if (@space_state == true)
	end

	def check_health
		if (@warrior_health < 15) && (@in_combat == false)
			@warrior.rest!
			@action_taken = true
		end
	end

	def attack_monster
		if (@space_state == false)
			@warrior.attack!

			@action_taken = true
			@in_combat 		= true
		else
			@in_combat			= false
		end
	end

	def move_warrior
		@warrior.walk! if @action_taken == false
		@action_taken = true
	end

	####################
	# Play Turn Method #
	####################

  def play_turn(warrior)

  	# Allow warrior to be accessed in all sections.
  	@warrior = warrior

  	# Sense environment for clues.
  	sense_environment

  	# Check health of the warrior.
  	check_health

  	# Attack monster if present.
  	attack_monster

  	# Move warrior in a specific direction.
  	move_warrior

  	# Setup stage                                                    

  end

end