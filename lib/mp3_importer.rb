require 'pry'
class MP3Importer 
  attr_accessor :path
  
  
  def initialize(path)
    self.path = path
  end
  
  def import
    self.files.each{ |filename| Song.new_by_filename(filename) }
  end
  
  def files 
    Dir[@path+"/*.mp3"].map { |file| file.split("/").last }
  end
  
end