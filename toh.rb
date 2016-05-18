# Tower of Hanoi
# There are 3 rods
# players must move the top most disk
# no disc can be placed on a smaller disc
# illegal moves
	# the player cannot move onto a smaller disc
	# the player must take the top most disc - this can be a default
# welcome the player to the game
# request the number of discs to play with

require 'pry'


	# ensure the player disc selection is not an alpha character
	def valid_choice_to_start?

	  correct_selection = false

		while correct_selection == false

			number_of_discs = gets.chomp.to_i
			discs_to_start_prompt

			if number_of_discs <= 0
				puts "Please enter a valid number"
			else
				return number_of_discs
			end

		end

	end

	def discs_to_start_prompt
		puts "Please enter the number of discs to play with"
		print "> "
	end



	def exit?( player_input = "" )
			if player_input.to_s.upcase == "EXIT"
				exit
			else
				return true
			end
	end








	# method to print out the towers when called for player to see status of game
	def print_towers( towers_hash, number_of_discs )

		# runs through the hash to print a visual represenation of the towers
		towers_hash.each { |k, v|
				# lists the tower # and some space for readability
				print "Tower #{k+1}"
				puts  ""
				puts  ""

				# reverse the array to print smallest to largest and iterate through each array item in order to conver to treat each as an integer // otherwise it will treat as an array and ERROR
				v.reverse.each { |display|

					puts "#{'O' * display}"

				}

				# prints a nice divider below each tower printout
				print "#{'-' * number_of_discs}"

				puts  ""

			}

	end



	# checks that the player is only selecting a tower 1 2 or 3 - returning true will allow players to progress
	def valid_tower_choice?( tower_choice )

		( 1..3 ) === tower_choice ?  true :  false

	end



	def make_another_selection
		puts "That move isn't allowed, please select another tower..."
	end



# run the method that prompts the player for the number of discs to start with and store that value into number_of_discs


disc_being_moved = 0


# welcome the player to the game
puts "Welcome to Tower of Hanoi"
puts "If you ever want to stop type EXIT"

discs_to_start_prompt

number_of_discs = valid_choice_to_start?

# store the original tower hash populated with the number of discs to start with ... the first tower[0] is reversed so the smallest disc(1) can be popped or pushed as game progresses
towers_hash = { 0 => ( ( 1..number_of_discs).to_a.reverse ), 1 => [], 2 => [] }

# the winning outcome is established which dupicates the first tower, only in the third tower - this will be checked in the while loop that encompasses the game
victory = { 0 => [], 1 => [], 2 => ( (1..number_of_discs ).to_a.reverse ) }

	# until the winning outcome is reached the loop continues
	while towers_hash != victory do

		# print the array each pass


#############    MOVE FROM TOWER WHILE LOOP    ################

		valid_move = false

		while valid_move == false do

			# print tower hash so player can see status
			print_towers( towers_hash, number_of_discs )

			puts ""
			print "Move disc from?  "

			# player inputs which tower they want to move from
			move_from_tower = gets.chomp.to_i


			# call the valid? method to make sure the selection is in range of the number of towers available
			if valid_tower_choice?( move_from_tower ) == true

				# if the tower they want to move from has discs in it they can make a move
				if towers_hash[ ( move_from_tower - 1 ) ].empty? == false

					# change the variable to true to exit the while loop
					valid_move = true

					# with the correct tower selected the disc is removed from the corresponding tower stored in the disc_being_moved var and removed from the towers array with POP
					disc_being_moved = towers_hash[ ( move_from_tower - 1 ) ].pop

				# otherwise they need to select the right tower
				elsif make_another_selection

				end

			# otherwise they need to select the right tower
			elsif make_another_selection

			end

		end #/.While Loop for checking for a valid move from the tower


###############    MOVE TO TOWER WHILE LOOP     #####################


		# reset the valid move to false for the move to tower while loop
		valid_move = false

		# while loop to check that the tower MOVING TO is valid
		while valid_move == false do

			# ask the player where to move the disc
			print "Move disc to? "

			# store the player selection into the variable
			move_to_tower = gets.chomp.to_i
			puts ""

			if valid_tower_choice?(move_to_tower) == true

				# if the selected tower is empty we can place it there - easy peezy
				if towers_hash[ ( move_to_tower - 1 ) ].empty? == true

					# generate the true value to exit the while loop
					valid_move = true

					# the tower's corresponding hash value is populated with the disc being moved
					towers_hash[ ( move_to_tower - 1) ] << disc_being_moved



				# if the selected tower is not empty then we check if the disc is biiger than the disc being moved to generate a new selection if true
				elsif towers_hash[ ( move_to_tower - 1 ) ].empty? == false && disc_being_moved > towers_hash[ ( move_to_tower - 1 ) ].last

					puts "Your disc is larger than tower #{move_to_tower}'s disc"
					puts ""

					# prompt player they need to pick a valid move
					puts make_another_selection

					# print tower hash so player can see status
					print_towers(towers_hash, number_of_discs)




				# if the array corresponding the tower the player selected is empty and the disc the are moving is 'smaller' they can make this move
				elsif towers_hash[ ( move_to_tower - 1 ) ].empty? == false && disc_being_moved < towers_hash[ ( move_to_tower - 1 ) ].last

					# populate the disc to move to the hash that corresponds to the tower the player selected
					towers_hash[ ( move_to_tower - 1 ) ] << disc_being_moved

					#change the valid move to true to end the while loop
					valid_move = true

				end

			else

				# prompt player they need to pick a valid move
				puts make_another_selection
		    puts ""

			end

		end #/. Move to Tower While Loop

	end # /.victory loop only exits if player wins

# print tower hash so player can see status
print_towers(towers_hash, number_of_discs)

# display victory message
puts "YOU WIN! Nice Work!"
