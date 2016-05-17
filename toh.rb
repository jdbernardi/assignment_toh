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



number_of_discs = valid_choice?

towers_hash = { 0 => ((1..number_of_discs).to_a.reverse), 1 => [], 2 => [] }

victory = { 0 => [], 1 => [], 2 => ((1..number_of_discs).to_a.reverse) }

disc_being_moved = 0
valid_move = false



while valid_move == false do

puts "Please enter which tower to move your disc from"
print ">"
move_from_tower = gets.chomp.to_i

	if (1..3) === move_from_tower
		if towers_hash[( move_from_tower - 1 )].empty? == false
			valid_move = true

			disc_being_moved = towers_hash[( move_from_tower - 1 )].pop
		end
	end

end

puts "Please enter which tower to move the disc to"
print ">"
move_to_tower = gets.chomp.to_i
puts ""

# for printing the towers
# start by receiving the current arrays of each tower

case move_to_tower
	when 1
		towers_hash[0] << disc_being_moved
	when 2
		towers_hash[1] << disc_being_moved
	when 3
		towers_hash[2] << disc_being_moved
	else
		puts "Please enter a valid tower number"
end


print towers_hash
puts ""

valid_move = false

while valid_move == false do

puts "Please enter which tower to move your disc from"
print ">"
move_from_tower = gets.chomp.to_i

	if (1..3) === move_from_tower
		if towers_hash[( move_from_tower - 1 )].empty? == false
			valid_move = true

			disc_being_moved = towers_hash[( move_from_tower - 1 )].pop
		end
	end

end


puts "Please enter which tower to move the disc to"
print ">"
move_to_tower = gets.chomp.to_i
puts ""

case move_to_tower
	when 1
		towers_hash[0] << disc_being_moved
	when 2
		towers_hash[1] << disc_being_moved
	when 3
		towers_hash[2] << disc_being_moved
	else
		puts "Please enter a valid tower number"
end


print towers_hash
puts ""

valid_move = false

while valid_move == false do

puts "Please enter which tower to move your disc from"
print ">"
move_from_tower = gets.chomp.to_i

	if (1..3) === move_from_tower
		if towers_hash[( move_from_tower - 1 )].empty? == false
			valid_move = true
			disc_being_moved = towers_hash[( move_from_tower - 1 )].pop
		end
	end

end


puts "Please enter which tower to move the disc to"
print ">"
move_to_tower = gets.chomp.to_i
puts ""


case move_to_tower
	when 1
		towers_hash[0] << disc_being_moved
	when 2
		towers_hash[1] << disc_being_moved
	when 3
		towers_hash[2] << disc_being_moved
	else
		puts "Please enter a valid tower number"
end


print towers_hash
puts ""

# the discs must correspond to a size - an array for each tower can store the numbers
	# pushing to the tower is placing a disc
	# pop from a tower is removing a disc
# on the leftmost tower

# the player will be prompted to make thier first move


	# they will be asked which tower (1, 2, or 3)
	# then they will be asked which tower to move to


		# if the tower is empty the disc can go there




			# the disc size needs to be checked to see if the disc is larger
				# if it is larger
					# the disc is placed
				# if is is smaller the player is asked to select another tower
		# the player wins if all the discs are stacked in the correct order on the last tower
			# that tower can have a check if the array is the winning combo
		# a check must be in place the original tower is not counted as a WIN
