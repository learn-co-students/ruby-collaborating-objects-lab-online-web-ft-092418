require 'pry'
class Song
  attr_accessor :name, :artist
  
  def initialize(title)
    self.name = title
  end
  
  def self.new_by_filename(filename)
    name = filename.split("-")[1].strip()
    artist = filename.split("-")[0].strip()
    song = Song.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.artist.songs << song
    song
  end
end