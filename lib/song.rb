class Song
  require 'pry'

  attr_accessor :name, :artist, :genre, :artist_name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if artist == nil
      @artist = artist
    else
      self.artist=(artist)
    end

    if genre == nil
      @genre = genre
    else
      self.genre=(genre)
    end
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

  def self.create(name)
    s = self.new(name)
    s.name = name
    s.save
    s
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end


  def genre=(genre)
    genre.songs << self unless genre.songs.include?(self)
    @genre = genre
  end

  def self.find_by_name(name)
    @@all.each do |song|
      if song.name == name
        return song
      end
    end
    false
  end


  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file_name)
    file_artist, song_name, song_genre_mp3 = file_name.split(" - ")
    song_genre = song_genre_mp3.split(".").first
    new_song = self.new(song_name)
    new_song.artist = Artist.find_or_create_by_name(file_artist)
    new_song.genre = Genre.find_or_create_by_name(song_genre)
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
    new_song
  end

  def self.alphabetical
     @@all.sort_by{|song| song.name}
  end

end
