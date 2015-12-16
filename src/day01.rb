# Solution to Day 01 from Advent of Code
# http://adventofcode.com/
# 
# Author: Steven Briggs
# Version: 2015.12.16

# Determine whether to move up or down a floor
def move_to_new_floor(char)
    case char
        when '('
        	return 1
        when ')'
	        return -1
	    else
	    	return 0
	end
end

# Process the input file character-by-character to determine the final floor
floor = 0
input = File.new("input/day01.txt", "r");
if input
    input.each_char { |char| floor += move_to_new_floor(char) }
else
    puts "Unable to open file!"
end

puts floor