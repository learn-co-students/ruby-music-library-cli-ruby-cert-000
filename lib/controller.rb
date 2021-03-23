class MusicLibraryController

  attr_accessor :path, :list_songs

  def initialize(path = "./db/mp3s")
    self.path = path
    MusicImporter.new(path).import
  end

  def call
    input = ""

    while input!= "exit"

      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.strip

      if input == "list songs"
        self.list_songs
      end

      if input == "list artists"
        self.list_artists
      end

      if input == "list genres"
        self.list_genres
      end

      if input == "list artist"
        self.list_songs_by_artist
      end

      if input == "list genre"
        self.list_songs_by_genre
      end

      if input == "play song"
        self.play_song
      end
    end

    def list_songs
      counter = 1
      song_list = Song.alphabetical
      song_list.each do |song|
        puts "#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        counter += 1
      end
    end

    def list_artists
      counter = 1
      artist_list = Artist.alphabetical
      artist_list.each do |artist|
        puts "#{counter}. #{artist.name}"
        counter += 1
      end
    end

    def list_genres
      counter = 1
      genre_list = Genre.alphabetical
      genre_list.each do |genre|
        puts "#{counter}. #{genre.name}"
        counter += 1
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.strip

      counter = 1
      song_list = Song.alphabetical
      song_list.each do |song|
        if song.artist.name == input
        puts "#{counter}. #{song.name} - #{song.genre.name}"
        counter += 1
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets.strip

      counter = 1
      song_list = Song.alphabetical
      song_list.each do |song|
        if song.genre.name == input
        puts "#{counter}. #{song.artist.name} - #{song.name}"
        counter += 1
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      input = gets.strip

      song = Song.all[gets.to_i]

      if song == nil
        false
      elsif Song.all.size < input.to_i || 1 > input.to_i
        false
      else
        puts "Playing #{song.name} by #{song.artist.name}"
      end

    end



  end


end
