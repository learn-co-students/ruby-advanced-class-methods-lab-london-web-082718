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
    self.all.find {|x| x.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      find_by_name(name)
    else
    create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
  
  def self.new_from_filename(filename)
    holding_array = filename.split(" - ")
    artist_name = holding_array[0]
    song_name = holding_array[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def self.create_from_filename(filename)
   holding_array = filename.split(" - ")
    artist_name = holding_array[0]
    song_name = holding_array[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  
    end
    
    def self.destroy_all
      self.all.clear
    end
end
