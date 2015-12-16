# Solution to Day 04 from Advent of Code
# http://adventofcode.com/
# 
# Author: Steven Briggs
# Version: 2015.12.17

require "digest/md5"

key = "iwrupvqb"
i = 1

# A simple brute-force approach, just try every integer
while true
	hash = Digest::MD5.hexdigest("#{key}#{i}")
	if hash.slice(0, 5) == "00000"
		break
	end

	i += 1
end

puts i