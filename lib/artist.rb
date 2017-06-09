class Artist
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    self.songs << song
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_or_create_by_name(name)
    main_artist = self.all.each.find do |artist|
      artist.name == name
    end
    main_artist ? main_artist : Artist.new(name)
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end
end
