# Tower of Hanoi
# There are 3 rods
# players must move the top most disk
# no disc can be placed on a smaller disc
# illegal moves
	# the player cannot move onto a smaller disc
	# the player must take the top most disc - this can be a default
# welcome the player to the game
# request the number of discs to play with
puts "Welcome to Tower of Hanoi"


# first start with the number of discs in the game

# the game will start with 3 towers and the number of discs
# the first tower will be populated and reversed so the top disc can be popped with each command

# removing the disc from the desired tower

puts "Please enter the number of discs to play with"
print ">"
number_of_discs = gets.chomp.to_i


puts "Please enter which tower to move your disc from"
print ">"
move_from_tower = gets.chomp.to_i


puts "Please enter which tower to move the disc to"
print ">"
move_to_tower = gets.chomp.to_i

tower_1 = (1..number_of_discs).to_a.reverse
tower_2 = []
tower_3 = []

turn_count = 0

disc_being_moved = 0

case move_from_tower
when 1
  disc_being_moved = tower_1.pop
when 2
  disc_being_moved = tower_2.pop
when 3
  disc_being_moved = tower_3.pop
else
  puts "Please enter a tower number from 1-3"
end

case move_to_tower
	when 1
		tower_1 << disc_being_moved
	when 2
		tower_2 << disc_being_moved
	when 3
		tower_3 << disc_being_moved
	else
		puts "Please enter a valid tower number"
end

print tower_1
puts ""
print tower_2
puts ""
print tower_3

puts "Please enter which tower to move your disc from"
print ">"
move_from_tower = gets.chomp.to_i


puts "Please enter which tower to move the disc to"
print ">"
move_to_tower = gets.chomp.to_i


case move_from_tower
when 1
  disc_being_moved = tower_1.pop
when 2
  disc_being_moved = tower_2.pop
when 3
  disc_being_moved = tower_3.pop
else
  puts "Please enter a tower number from 1-3"
end

case move_to_tower
	when 1
		tower_1 << disc_being_moved
	when 2
		tower_2 << disc_being_moved
	when 3
		tower_3 << disc_being_moved
	else
		puts "Please enter a valid tower number"
end

print tower_1
puts ""
print tower_2
puts ""
print tower_3


# the discs must correspond to a size - an array for each tower can store the numbers
	# pushing to the tower is placing a disc
	# popping from a tower is removing a disc
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
