class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    @files = Dir[@path+'/*']
    @files.map! {|file| file.gsub(@path+'/','')}
  end

  def import
    self.files
    @files.each do |file|
      Song.new_by_filename(file)
    end
    Artist.all.uniq!
  end

end
