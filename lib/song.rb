class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find do
      |song| name == song.name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do
      |song| song.name
    end
  end

  def self.new_from_filename(filename)
    file_array = filename.split(" - ")

    artist_name = file_array[0]
    name = file_array[1].gsub(".mp3","")

    song = self.new
    song.artist_name = artist_name
    song.name = name
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end

end
