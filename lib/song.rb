require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all     # reader method  for the @@all class variable
    @@all          # method exposes this piece of data to the rest of our application
  end

  def save
    self.class.all << self
  end

  def self.create     # class constructor
    song = self.new   # initializes the song, self refers to the entire Song class
    self.all << song   # self.all is the reader for the @@all class variable as we know
    song
  end

  def self.new_by_name(song_title)
    song = self.new   # initializes the song, self refers to the entire Song class
    song.name = song_title   # song.name  - name is a property of song
    song
  end

  def self.create_by_name(song_title)
    song = self.create
    song.name = song_title   # song.name  - name is a property of song
    song
  end

  def self.find_by_name(song_title)
    @@all.find{|song| song.name == song_title}
  end

  def self.find_or_create_by_name(song_title)
        # either return a matching song instance with that name or create
        # a new song with the name and return the song instance
    match = self.find_by_name(song_title)
    if match        # i.e. if something is found..
      return match
    else
      self.create_by_name(song_title)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name }   # sorting by song.name (the name property)
  end


# For this method - critical to look at the example and file format passed in
  def self.new_from_filename(format)
    array_split_string = format.split(" - ")
    # creates array from the format string
    array_split_string[1] = array_split_string[1].chomp(".mp3")
    # chomp deletes the .mp3 bit, i.e. the quoted string
    #binding.pry
    song = self.new
    song.name = array_split_string[1]
    song.artist_name = array_split_string[0]
    song
  end


  def self.create_from_filename(format)
    new_song = self.new_from_filename(format)
    # assign a result / new_song based on the previous method - #new_from_filename
    # no need to duplicate this - ENCAPSULATE WHEN POSSIBLE
    song = self.create
    # need to create song, and push to self.all i.e. @@all

    # since new_song has the attributes of .name and .artist_name
    song.name = new_song.name
    song.artist_name = new_song.artist_name
    song
  end


  def self.destroy_all
    self.all.clear
  end

end
