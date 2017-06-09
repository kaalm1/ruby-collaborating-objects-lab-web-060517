class Song

  attr_accessor :artist, :name

  def initialize(name)
    @name = name
  end


  def self.new_by_filename(file_name)
    info = file_name.split('-')
    artist = info[0][0..-2]
    song = info[1][1..-2]
    new_song = Song.new(song)
    new_artist = Artist.find_or_create_by_name(artist)
    new_artist.add_song(song)
    new_artist.save
    new_song.artist = new_artist
    new_song
  end

end
