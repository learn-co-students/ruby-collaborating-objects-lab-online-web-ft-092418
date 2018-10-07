class Song 
  attr_accessor :name, :artist
  
  def initialize(name)
    @name = name
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
  
  def self.new_by_filename(filename)
    artistname, name, genrename = filename.split(" - ")
    song = self.new(name)
    #binding.pry
    song.artist_name = artistname
    song
  end
end