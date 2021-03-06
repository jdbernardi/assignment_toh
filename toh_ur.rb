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

puts "Welcome to Tower of Hanoi"
puts "If you ever want to stop type EXIT"


# first start with the number of discs in the game

# the game will start with 3 towers and the number of discs
# the first tower will be populated and reversed so the top disc can be popped with each command

# removing the disc from the desired tower

# ensure the player disc selection is not an alpha character
def valid_choice?

  correct_selection = false

	while correct_selection == false

		puts "Please enter the number of discs to play with"
		print ">"
		number_of_discs = gets.chomp.to_i

		if number_of_discs == 0
			puts "Please enter a valid number"
		else
			return number_of_discs
		end

	end

end

def exit?(player_input="")
		if player_input.to_s.upcase == "EXIT"
			exit
		end
end


def print_towers(towers_hash, number_of_discs)


	towers_hash.each { |k, v|
			print "Tower #{k+1}"
			puts ""
			puts ""
			v.reverse.each { |display|
				puts "#{'O' * display}"
			}

			print "#{'-' * number_of_discs}"
			puts ""

		}

end

def make_another_selection
	puts "That move isn't allowed, please select another tower..."
end

number_of_discs = valid_choice?


towers_hash = { 0 => ((1..number_of_discs).to_a.reverse), 1 => [], 2 => [] }

victory = { 0 => [], 1 => [], 2 => ((1..number_of_discs).to_a.reverse) }


disc_being_moved = 0

while towers_hash != victory do

	# print the array each pass


	valid_move = false

	while valid_move == false do

		print_towers(towers_hash, number_of_discs)

		puts ""
		print "Move disc from?  "

		move_from_tower = gets.chomp.to_i

		if (1..3) === move_from_tower
			if towers_hash[( move_from_tower - 1 )].empty? == false
				valid_move = true
				disc_being_moved = towers_hash[( move_from_tower - 1 )].pop
			elsif make_another_selection
			end
		elsif make_another_selection
		end

	end

# set up the valid move as false for the while loop
	valid_move = false

	# while loop to check that the tower MOVING TO is valid
	while valid_move == false do

		print "Move disc to? "
		move_to_tower = gets.chomp.to_i
		puts ""

		if (1..3) === move_to_tower
			# if the selected tower is empty we can place it there
			if towers_hash[ ( move_to_tower - 1 ) ].empty? == true

				valid_move = true
				towers_hash[ ( move_to_tower - 1) ] << disc_being_moved

			# if the selected tower is not empty then we check if the disc is biiger than the disc being moved
			elsif towers_hash[ ( move_to_tower - 1 ) ].empty? == false && disc_being_moved > towers_hash[ ( move_to_tower - 1 ) ].last

				puts "Your disc is larger than tower #{move_to_tower}'s disc"
				puts ""
				puts make_another_selection
				print_towers(towers_hash, number_of_discs)


			# if the disc to move is small than the destination, we place it
			elsif towers_hash[ ( move_to_tower - 1 ) ].empty? == false && disc_being_moved < towers_hash[ ( move_to_tower - 1 ) ].last

				towers_hash[ ( move_to_tower - 1 ) ] << disc_being_moved

				#change the valid move to true to end the while loop
				valid_move = true

			end
		else
			puts make_another_selection
	    puts ""
		end

	end #/. Move to Tower While Loop


# for printing the towers
# start by receiving the current arrays of each tower




end # /.victory loop

puts "YOU WIN"

