require 'erb'

class InitSongs
  def initialize(song)
    @song = song
  end

  def get_binding
    binding
  end
end