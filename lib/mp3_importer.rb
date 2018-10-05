


class MP3Importer
  attr_accessor :path 
  
  def initialize (directory)
    self.path = directory
  end
  
  def files 
    files= Dir.entries(@path).select {|f| !File.directory? f}
    files = files.map{ |file| file if file.include?(".mp3")}
  end
  
   def import
    self.files.map{ |filename| Song.new_by_filename(filename) }
  end
  
  
  
end