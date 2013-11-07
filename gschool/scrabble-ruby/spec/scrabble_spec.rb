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

describe Player do

  let(:player1) {Player.new("Frank")}
  let(:player2) {Player.new("Katrina")}

  it "should have a name" do
    player1.name.should eq "Frank"
    player2.name.should eq "Katrina"
  end

  it "should keep track of score" do
    player1.plays("hello").should eq 8
    player2.plays("word").should eq 8
    player1.plays("home").should eq 9
    player2.plays("sound").should eq 6
    player1.score.should eq 17
    player2.score.should eq 14
    player1.leading?(player2).should be_true
  end

  it "should keep track of letters" do
    (player1.letters = ['a']).should eq ['a']
    (player1.add_letter('w')).should eq ['a', 'w']
    (player1.add_letters(['i', 'n', 'd'])).should eq ['w', 'a', 'i', 'n', 'd']  
    player1.plays("win").should eq 6
    player1.letters.should eq ['a', 'd']
end

end