# Part 1:

artist = Artist.new(:name => "Wu-Tang Clan")
album  = Album.new(:name => "36 Chambers")

artist.albums << album

album.songs << Song.new(:name => "Bring da Ruckus")
album.songs << Song.new(:name => "C.R.E.A.M.")
album.songs.build(:name => "Protect Ya Neck")
album.songs.build(:name => "Method Man")

artist.save

# Part 2

s1 = Song.new(:name => "Gimme the Loot")
s2 = Song.new(:name => "Dead Wrong")
s3 = Song.new(:name => "Hypnotize")

s1.album = Album.new(:name => "Ready to Die")
s2.album = Album.new(:name => "Born Again")
s3.album = Album.new(:name => "Life After Death")

art = Artist.new(:name => "Notorious B.I.G.")

s1.album.artist = art
s2.album.artist = art
s3.album.artist = art

s1.save
s2.save
s3.save