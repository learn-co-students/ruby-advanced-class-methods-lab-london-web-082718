require 'pry'

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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end

  def self.find_by_name(title)
    result = self.all.find{|song| song.name == title}
    result
  end

  def self.find_or_create_by_name(title)
    result = self.find_by_name(title)
    if result
      result
    else
      self.create_by_name(title)
    end

  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file)
    info_array = file.split(" - ")
    the_song = info_array[1].split(".")
    song = self.new
    song.artist_name = info_array[0]
    song.name = the_song[0]
    song

  end

  def self.create_from_filename(file)
    info_array = file.split(" - ")
    the_song = info_array[1].split(".")
    song = self.new
    song.artist_name = info_array[0]
    song.name = the_song[0]
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
