class Scrabble
	
	def self.score(word)
    letters = word.to_s.upcase.split('')
    letters.inject(0) do |accumulator, letter|
      accumulator += score_letter(letter)
    end
  end

  def self.score_letter(letter)
    letter_scores[letter]
  end

  def self.highest_score_from(list)
    score, top_words = grouped_by_score(list).max
    bonus_word_from(top_words) || shortest_from(top_words)
  end

  def self.bonus_word_from(words)
    words.detect{|word| word.length == 7}
  end

  def self.shortest_from(words)
    words.min_by{|word| word.length}
  end

  def self.grouped_by_score(list)
    list.group_by{|word| score(word)}
  end

  def self.letter_scores
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

end

########################################
########################################

class Player
  attr_accessor :letters, :name, :score

  def initialize(name)
    @name  = name
    @score = 0
  end

  def plays(word)
    word_score = Scrabble.score(word)
    self.score = score + word_score
    word_score
  end

  protected

  def leading?(other_player)
    score > other_player.score
  end

end



<<-old

class Scrabble
  
  MAX_LENGTH = 7
  SCORES     = {
                "A"=>1, "B"=>3, "C"=>3, "D"=>2, "E"=>1, "F"=>4,
                "G"=>2, "H"=>4, "I"=>1, "J"=>8, "K"=>5, "L"=>1,
                "M"=>3, "N"=>1, "O"=>1, "P"=>3, "Q"=>10,"R"=>1,
                "S"=>1, "T"=>1, "U"=>1, "V"=>4, "W"=>4, "X"=>8,
                "Y"=>4, "Z"=>10
               }

  def self.score(word)
    return 0 if (word.nil? || word.empty?)
    word.upcase.chars.inject(0){|sum,c| sum + SCORES[c]}
  end

  def self.highest_score_from(words)
    score_hash = Hash.new {|h,k| h[k] = [] }
    words.each {|word| score_hash[score(word)] << word}

    win_words = score_hash.max.flatten.drop(1) 
    win_words.size == 1 ? win_words.first : find_best_word(win_words)
  end

  private

  def self.find_best_word(words)
    longest_length = words.max_by(&:length).length
    
    if longest_length == MAX_LENGTH
      words.detect {|word| word.length == MAX_LENGTH}
    else
      words.sort_by(&:length).first
    end
  end

end

old