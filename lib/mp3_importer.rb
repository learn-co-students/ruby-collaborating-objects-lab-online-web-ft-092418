require "pry"
class MP3Importer

    attr_accessor :path, :files

    def initialize(filepath)
        self.path = filepath
        self.files = Dir.entries(filepath)
        self.files.delete_if {|file| file == "." || file == ".." } 
    end

    def import         
        self.files.each {|file| Song.new_by_filename(file)}
    end 

end