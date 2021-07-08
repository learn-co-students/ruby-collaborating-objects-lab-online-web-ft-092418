class Artist 
  attr_accessor :name 
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    self.name = name 
    @songs = []
  end 
  
  def add_song(song)
    @songs << song
    song.artist = self
  end 
  
  def self.all
    @@all
  end 
  
  def save
    @@all << self 
  end 
  
  def self.create_artist_by_name(name)
    artist = Artist.new(name) 
    artist.save
    artist
    
  end 
  
  def self.find_artist_by_name(name)
    self.all.find {|artist| artist.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if artist = self.find_artist_by_name(name)
      artist 
    else
      self.create_artist_by_name(name)
    end
    
  end 
  
  def print_songs
    @songs.each {|song| puts song.name}
  end 
end 