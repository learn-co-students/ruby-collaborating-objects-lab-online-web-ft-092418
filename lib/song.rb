require "pry"

class Song

    attr_accessor :name, :artist, :genre

    def initialize(name)
        self.name = name
    end


    def self.new_by_filename(filename)
        arr = filename.split(" - ")
        temp_artist = arr[0]
        temp_name = arr[1]
        temp_genre = arr[2][0...-4]
        
        self.new(temp_name).tap { |song| 
            song.artist = Artist.find_or_create_by_name(temp_artist)
            song.artist.add_song(song)
        }
    end 
end