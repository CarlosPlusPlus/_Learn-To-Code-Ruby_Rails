require 'bundler'
Bundler.require
require './lib/scrabble'

describe Scrabble do

  describe "#score" do
    
    it "scores a single letter" do
      expect( Scrabble.score("a") ).to eq 1
      expect( Scrabble.score("f") ).to eq 4
    end

    it "scores a word" do
    	expect( Scrabble.score("hello")  ).to eq 8
    	expect( Scrabble.score("penguin")).to eq 10
    end

    it "handles empty or nil cases" do
    	expect( Scrabble.score("") ).to eq 0
    	expect( Scrabble.score(nil)).to eq 0
    end

    it "scores a word independent of case" do
    	expect( Scrabble.score("wOrLD")).to eq 9
    end

  end

  describe "#higest_score_from" do

  	it "picks word with the highest total score" do
  		Scrabble.highest_score_from(['home', 'word', 'hello', 'sound']).should eq "home"
  	end

  	it "picks lowest tiled word when scores are tied" do
  		Scrabble.highest_score_from(['hello', 'word', 'sound']).should eq "word"
  	end

  	it "picks word if 7 tiles are used" do
  		Scrabble.highest_score_from(['home', 'word', 'silence']).should eq "silence"
  	end

  	it "picks first word when words are of same length and score" do
  		Scrabble.highest_score_from(['hi', 'word', 'ward']).should eq "word"
  	end

  end

end
