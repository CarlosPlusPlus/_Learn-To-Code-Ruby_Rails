require 'erb'

class InitArtist
  def initialize(artist)
    @artist = artist
  end

  def get_binding
    binding
  end
end