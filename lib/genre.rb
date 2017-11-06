class Genre
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

  def self.create(created_genre)
    s = self.new(created_genre)
    s.save
    s
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
  end

  def self.alphabetical
     @@all.sort_by{|genre| genre.name}
  end

end
