# Solution to Day 07 from Advent of Code
# http://adventofcode.com/
# 
# Author: Steven Briggs
# Version: 2015.12.16

# Class that represents a logical gate
class Gate
	attr_reader :expression, :name, :input1, :input2, :operator, :value

	def initialize(expression)
		@expression = expression
		parse(expression)
	end

	def parse(expression)
		args = expression.split(" ")

        if expression.include? "NOT"
        	@operator = "NOT"
        	@input1 = args[1]
        	@name = args[3]

        elsif expression.include? "AND"
        	@operator = "AND"
        	@input1 = args[0]
        	@input2 = args[2]
        	@name = args[4]

        elsif expression.include? "OR"
        	@operator = "OR"
        	@input1 = args[0]
        	@input2 = args[2]
        	@name = args[4]

        elsif expression.include? "XOR"
        	@operator = "XOR"
        	@input1 = args[0]
        	@input2 = args[2]
        	@name = args[4]

        elsif expression.include? "LSHIFT"
        	@operator = "LSHIFT"
        	@input1 = args[0]
        	@input2 = args[2]
        	@name = args[4]

        elsif expression.include? "RSHIFT"
        	@operator = "RSHIFT"
        	@input1 = args[0]
        	@input2 = args[2]
        	@name = args[4]

        else
        	@value = args[0]
        	@name = args[2]
        end
	end

	def to_s
		@expression
	end
end

File.open("input/day07.txt", "r") do |input|
	gates = Array.new()

	input.each_line do |line|
		gates.push(Gate.new(line.chomp))
	end

	# Sort the gates into a proper straight-line program
	gates = gates.sort {|x, y| 
        if x.name.length > y.name.length
        	1
        elsif x.name.length < y.name.length
        	-1
        else
        	x.name <=> y.name
        end
	}

	# Evaluate each gate except the very first one
	for i in 1..gates
		puts gates[i]
	end
end





