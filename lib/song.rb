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

  def self.new_by_name(new_by_name)
    song = self.new
    song.name = new_by_name
    song 
  end

  def self.create_by_name(create_by_name)
    song = self.create 
    song.name = create_by_name
    song 
  end 

  def self.find_by_name(song)
    @@all.find do |song_name|
      song_name.name == song
    end 
  end 

  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create_by_name(song)
  end 

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end  
  end 

  # new file format --> "Name - Song.mp3"
  # not sure how to use gsub yet
  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")
    
    song = self.new 
    song.name = song_name
    song.artist_name = artist_name
    song
  end 

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = parts[0]
    song_name = parts[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear 
  end 

end 

# song = Song.create

#binding.pry 