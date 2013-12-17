#!/usr/bin/env ruby
require 'pry-debugger'

<<-INSTRUCTIONS

Sneaking from Word to Word
--------------------------

Find a path from one word to another.

A step is defined as:
	- A change of a single letter in the word that produces another valid word.

For bonus points, find the shortest path.

**************************

For example:
	bat, man -> (bat, ban, man)

Or a bit more fun:
	grouper, twister -> (grouper, grouser, grosser, grasser, glasser, classer,
										   clasher, flasher, flasker, flanker, franker, tranker,
										   thanker, thinker, thinner, twinner, twinter, twister)

INSTRUCTIONS

