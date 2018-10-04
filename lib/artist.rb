class Artist

    @@all = []

    attr_accessor :name, :songs

    def initialize(name)
        self.name = name
        self.songs = []
    end

    def add_song(song)
        self.songs << song unless self.songs.include?(song)
    end 

    def save
        self.class.all << self unless self.class.all.include?(self)
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find {|a| a.name == name}
    end 

    def self.create_by_name(name)
        Artist.new(name).tap{|a| a.save}
    end

    def self.find_or_create_by_name(name)
        
        # if artist = self.find_by_name(name)   
        #     artist
        # else 
        #     self.create_by_name(name)
        # end 
        #this is done by the below ternary operator

        temp_artist = self.find_by_name(name) 
        temp_artist ? temp_artist : self.create_by_name(name)        
    end

    def print_songs
        self.songs.each {|s| puts s.name}
    end 
end