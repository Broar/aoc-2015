# Solution to Day 06 from Advent of Code
# http://adventofcode.com/
# 
# Author: Steven Briggs
# Version: 2015.12.16

$lights = Array.new(1000) { Array.new(1000, false) }

# Toggle the lights from start to finish
def toggle(start, finish)
    for i in start[0]..finish[0]
    	for j in start[1]..finish[1]
    		$lights[i][j] = !$lights[i][j]
    	end
    end
end

# Flip the lights from start to finish to value
def flip(start, finish, value)
    for i in start[0]..finish[0]
    	for j in start[1]..finish[1]
    		$lights[i][j] = value
    	end
    end
end

# Count the number of turned on lights
def count()
	total = 0
	$lights.each_index do |i|
		$lights[i].each_index do |j|
			if $lights[i][j]
				total += 1
			end
		end
	end

	return total
end

# Process each line in the input file and parse it to determine whether
# lights should be turned on/off or toggled
File.open("input/day06.txt", "r") do |input|
	input.each_line do |line|

		args = line.split(" ")

		# Turn some number of lights on or off
		if args[0] == "turn"
			start = args[2].split(",").map {|value| value.to_i}
			finish = args[4].split(",").map {|value| value.to_i}

			if args[1] == "on"
				flip(start, finish, true)
			else
				flip(start, finish, false)
			end

        # Toggle some number of lights
		else
			start = args[1].split(",").map {|value| value.to_i}
			finish = args[3].split(",").map {|value| value.to_i}
			toggle(start, finish)
		end
	end

	puts count()
end