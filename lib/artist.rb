class Artist 
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all 
  end
  
  def add_song(song)
    song.artist = self
    @songs << song
  end
  
  def save 
    @@all << self
  end
  
   def self.find_by_name(name)
    self.all.find { |artist| artist.name == name }
  end
  
  def self.create_by_name(name)
    self.new(name).tap{ |artist| artist.save }
  end
  
  def self.find_or_create_by_name(name)
    if song = self.find_by_name(name) 
      song
    else 
      self.create_by_name(name)
    end
  end
  
  def print_songs
    songs.each{ |song| puts song.name }
  end
end