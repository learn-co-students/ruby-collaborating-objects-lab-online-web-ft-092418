class Artist
  attr_accessor :name , :songs 
  @@all = []
 
  def initialize(name)
    @name = name
    @songs = []
    self.save
  end
 
  def add_song (song)
    @songs << song
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.find_or_create_by_name(name)
    my_artist = @@all.detect{ |a|  a.name == name }
    
    if ( my_artist )
      my_artist
      
    else
      
      Artist.new ( name )
    end
    
  end
  
  def print_songs
    @songs.each{ |song|  puts song.name }
  end
 
end