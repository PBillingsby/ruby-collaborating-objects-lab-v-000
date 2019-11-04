class Artist
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
    save
  end
  def self.all
    @@all
  end

  def save
    @@all << self
  end
  def songs
    Song.all.select {|song| song.artist == self}
  end
  def add_song(song)
    @songs << song
    song.artist = self
  end
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
  
  def self.find_or_create_by_name(name)
    self.all.detect {|artist| artist.name == name} || self.new(name)
  end
end