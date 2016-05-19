# Tower of Hanoi
# RULES #
# There are 3 towers
# players must move the top most disk- this can be a default
# no disc can be placed on a smaller disc


require 'pry'



	# initial prompt for number of discs to play with
	def discs_to_start_prompt

		puts "Please enter the number of discs to play with"
		print "> "

	end


	# output whenever there is an invalid choice for tower number
	def make_another_selection

		# clears the screen so error message is on top
		system "clear"

		puts "That move isn't allowed, select a new tower or return your disc..."

	end


	# ensure the player disc selection is not an alpha character
	def valid_choice_to_start?

	  correct_selection = false

		while correct_selection == false

			number_of_discs = get_input_or_exit

			if number_of_discs <= 0

				puts "Please enter a valid number"

			else

				return number_of_discs

			end

		end

	end





	# determine if the user wishes to quit the game by checking for exit, if not, then an integer is returned
	def get_input_or_exit

		input = gets.chomp

		if input.upcase == "EXIT"
			puts "Thanks for playing!"
			exit

		else

			return input.to_i

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



###### START OF GAME ######


# welcome the player to the game
puts "Welcome to Tower of Hanoi"
puts "If you ever want to stop type EXIT"

# call method to prompt for number of discs to play with
discs_to_start_prompt


# call valid choice and store into num_of_discs if valid
number_of_discs = valid_choice_to_start?


# store the original tower hash populated with the number of discs to start with ... the first tower[0] is reversed so the smallest disc(1) can be popped or pushed as game progresses
towers_hash = { 0 => ( ( 1..number_of_discs).to_a.reverse ), 1 => [], 2 => [] }


# the winning outcome is established which dupicates the first tower, only in the third tower - this will be checked in the while loop that encompasses the game
victory = { 0 => [], 1 => [], 2 => ( (1..number_of_discs ).to_a.reverse ) }




# until the winning outcome is reached the loop continues
while towers_hash != victory do

	# print the array each pass


#############    MOVE FROM TOWER WHILE LOOP    ################


	# create variable set to FALSE to control while loop until player makes a valid selection
	valid_move = false


	while valid_move == false do

		# print tower hash so player can see status
		print_towers( towers_hash, number_of_discs )

		puts ""
		print "Move disc from?  "

		# player inputs which tower they want to move from
		player_move = get_input_or_exit


		# call the valid? method to make sure the selection is in range of the number of towers available
		if valid_tower_choice?( player_move ) == true

			# if the tower they want to move from has discs in it they can make a move
			if towers_hash[ ( player_move - 1 ) ].empty? == false

				# change the variable to true to exit the while loop
				valid_move = true

				# with the correct tower selected the disc is removed from the corresponding tower stored in the disc_being_moved var and removed from the towers array with POP
				disc_being_moved = towers_hash[ ( player_move - 1 ) ].pop

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
		player_move = get_input_or_exit
		puts ""

		if valid_tower_choice?(player_move) == true

			# if the selected tower is empty we can place it there - easy peezy
			if towers_hash[ ( player_move - 1 ) ].empty? == true

				# generate the true value to exit the while loop
				valid_move = true

				# the tower's corresponding hash value is populated with the disc being moved
				towers_hash[ ( player_move - 1) ] << disc_being_moved



			# if the selected tower is not empty then we check if the disc is biiger than the disc being moved to generate a new selection if true
			elsif towers_hash[ ( player_move - 1 ) ].empty? == false && disc_being_moved > towers_hash[ ( player_move - 1 ) ].last

				puts "Your disc is larger than tower #{player_move}'s disc"
				puts ""

				# prompt player they need to pick a valid move
				puts make_another_selection

				# print tower hash so player can see status
				print_towers(towers_hash, number_of_discs)




			# if the array corresponding the tower the player selected is empty and the disc the are moving is 'smaller' they can make this move
			elsif towers_hash[ ( player_move - 1 ) ].empty? == false && disc_being_moved < towers_hash[ ( player_move - 1 ) ].last

				# populate the disc to move to the hash that corresponds to the tower the player selected
				towers_hash[ ( player_move - 1 ) ] << disc_being_moved

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
