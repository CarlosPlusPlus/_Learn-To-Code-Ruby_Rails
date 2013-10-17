#!/bin/env ruby
# encoding: utf-8

<<-PROBLEM

Suppose that you are given a group of playing cards randomly selected from many combined decks.  Your task is to write a program to find the best Blackjack hand possible picking any cards from the group given, using each card in the input only once.

Blackjack hands are composed of two or more cards.  The value of a hand is determined by summing the individual points of all cards in the hand.  If the sum is less than or equal to 21, the hand’s value is the sum of the card points.  If the sum is greater than 21, then the hand is a “bust” and has a value of 0.  When breaking point-value ties, a hand with a lower number of cards is better.  If multiple hands hands have the same value and number of cards, any hand is acceptable.  Cards and point-values are listed below:

2 through 10 - numeric face value
A - 1 or 11 points (whichever of 1 or 11 makes the best hand can be used)
J, Q, K - 10 points

Here are a few examples:
“6 8 A 3” -> “6 A 3” (using A as 11 points)
“7 8 7 K 9 7” -> “7 7 7”
“3 4 5 J K” -> “J K”
“7 7 7 A Q” -> “A Q”
“9 9 A 7” -> “9 9 A” (using A as 1 point)
“K J Q” -> “K J” (valid)
“K J Q” -> “K Q” (also valid)

PROBLEM

require 'pry-debugger'

##################
# IMPLEMENTATION #
##################

class BlackjackSolver
	attr_accessor :combinations, :input

	VALUES = { "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5,
						 "6" => 6, "7" => 7, "8" => 8, "9" => 9, "10" => 10,
						 "J" => 10,"Q" => 10,"K" => 10,"A1" => 1,"A2" => 11
					 }

	def initialize(args)
		raise "Must pass in at least 2 valid cards." if args.size <= 1
		
		@input = args
		@combinations = []
	end

	def solve
		generate_combinations
	end

	private

	def generate_combinations
		
	end

end

########
# MAIN #
########

binding.pry
BlackjackSolver.new(ARGV).solve