# Solution to Day 03 from Advent of Code
# http://adventofcode.com/
# 
# Author: Steven Briggs
# Version: 2015.12.16

# Maintain a coordinate mapping of houses visited to the number of 
# presents delivered to them 
x = 0
y = 0
houses_to_presents = {"0,0" => 1}
houses_to_presents.default = 0
total = 1

File.open("input/day03.txt", "r") do |input|
	input.each_char do |char|

		# Update the coordinates
		# Always outputs 'Invalid token!' on the last iteration. Haven't pinned
		# down the cause but the final answer is still valid
        case char
            when '<'
                x -= 1
            when '^'
                y += 1
            when '>'
                x += 1
            when 'v'
            	y -= 1
            else
            	puts "Invalid token!
        end

        # Determine if this is the first time visiting this house.
        # If it is, then update the number of houses with at least one present
        coords = "#{x},#{y}"
        if houses_to_presents[coords] == 0
        	total += 1
        end

        houses_to_presents[coords] += 1
	end
end

puts total