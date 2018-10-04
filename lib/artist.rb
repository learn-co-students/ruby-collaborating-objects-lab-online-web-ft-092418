require "pry"
class Artist 
  attr_accessor :name, :songs 
  @@all = []
  def initialize(name)
    self.name = name
    self.songs = []
  end 
  
  def add_song(song) 
  
    self.songs << song unless self.songs.include?(song)
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    self.class.all << self
  end 
  
  def self.find_or_create_by_name(name)
    found_artist = nil 
    self.all.each {|artist| found_artist = artist if artist.name == name }
    if !found_artist
      Artist.new(name).tap {|artist| artist.save}
    else 
      found_artist
    end 
  end 
  
  def print_songs 
    self.songs.each{|song| puts song.name}
  end 
end 