# Solution to Day 02 from Advent of Code
# http://adventofcode.com/
# 
# Author: Steven Briggs
# Version: 2015.12.16

total_sqft = 0
File.open("input/day02.txt", "r") do |input|
	input.each_line do |line|
		dimensions = line.chomp.split('x').map { |str| str.to_i }
		l, w, h = dimensions
		sorted_dimensions = dimensions.sort
		slack = sorted_dimensions[0] * sorted_dimensions[1]
        total_sqft += (2 * l * w) + (2 * w * h) + (2 * h * l) + slack
	end
end

puts total_sqft