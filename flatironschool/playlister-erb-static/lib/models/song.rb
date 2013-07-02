class Song

  attr_accessor :name, :artist
  attr_reader :genre

  All = []
  
  def initialize
    All << self
  end

  def self.all
    All
  end

   def self.reset_songs
    All.clear
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

end 