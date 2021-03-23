class Artist
extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(created_artist)
    s = self.new(created_artist)
    s.save
    s
  end

  def add_song(song)
    if song.artist == nil
      song.artist = self
    end

    if songs.include?(song) == false
      @songs << song
    end

  end

  def genres
    @songs.collect{|s| s.genre}.uniq
  end

  def self.alphabetical
     @@all.sort_by{|artist| artist.name}
  end

end
