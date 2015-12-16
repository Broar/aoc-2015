# Solution to Day 05 from Advent of Code
# http://adventofcode.com/
# 
# Author: Steven Briggs
# Version: 2015.12.17

# Check that str contains at least three vowels
def check_vowels(str)
	vowels = ["a", "e", "i", "o", "u"]
	num = 0
    str.each_char do |char|
    	if vowels.include?(char)
    		num += 1
    		if num == 3
    			return true
    		end
    	end
    end

    return false
end

# Check that str at least one consecutive pair of matching characters 
def check_repeated_char(str)
	prev = str[0]
    for i in 1..str.length
    	if prev == str[i]
    		return true
    	else
    		prev = str[i]
    	end
    end

    return false
end

# Check that str does not contain the digraphs 'ab', 'cd', 'pq', or 'xy'
def check_digraphs(str)
    return str[/(ab|cd|pq|xy)/] == nil
end

# Process each line in the input file and determine if it is naughty or nice
total = 0
File.open("input/day05.txt", "r") do |input|
	input.each_line do |line|
		chomped = line.chomp
        if check_vowels(chomped) && check_repeated_char(chomped) && check_digraphs(chomped)
        	total += 1
        end
	end
end

puts total