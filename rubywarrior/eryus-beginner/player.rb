class Player

	#########################
	# Player Initialization #
	#########################

	# Initialize instance variables.
	def initialize
		@action_taken 	= false		# Did I take my action?
		@in_combat			= false		# Am I in combat?
		@space_empty		= false		# Is the space empty?
		
		@prv_health			= 20			# What was my previous health?
		@cur_health			=	20			# What is my current health?
	end

	# List of possible warrior actions.
	Actions = [:check_health,
						 :attack_monster,
						 :move_warrior]

	###########################
	# Pre and Post Processing #
	###########################

	def pre_sense
  	# Reset warrior action from previous turn.
		@action_taken		= false

		# Determine health and surroundings.
		@space_empty		= @warrior.feel.empty?
		@cur_health			= @warrior.health

		# Determine combat state.
		@in_combat = in_combat?
	end

	def post_sense
		@prv_health			= @warrior.health
	end

	##################
	# Action Methods #
	##################

	def check_health
		if (@warrior_health < 15) && (@in_combat == :no)
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

	##################
	# Helper Methods #
	##################

	# Did I lose health from last turn to this one?
	def lost_health?
		cur_health ~= prv_health ? true : false
	end

	# Am I in combat? If so, what "kind" of combat?
	def in_combat?
		combat_state = :no

		:near if (@space_empty == false)
		:far	if (@space_state == true) && (lost_health? == true)
		
		combat_state
	end

	#####################
	# Logic for Actions #
	#####################

	def perform_action
	end

	####################
	# Play Turn Method #
	####################

	def take_turn
		pre_sense				# Gather information on environment.
		perform_action	# Perform action based on known items.
		post_sense			# Store state of warrior for next turn.
	end

  def play_turn(warrior)
  	# Allow warrior to be accessed in all sections.
  	@warrior = warrior

  	# Take turn for the warrior.
  	take_turn
  end

end