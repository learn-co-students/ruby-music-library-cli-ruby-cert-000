class MusicImporter

  attr_reader :path

  def initialize(path = "./db/mp3s")
    @path = path
  end

  def files
    @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
  end

  def import
    files.each {|file_name| Song.create_from_filename(file_name)}
  end


end
