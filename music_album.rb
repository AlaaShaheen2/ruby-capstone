require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :label, :genre, :author, :source

  def initialize(on_spotify, publish_date)
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super and @on_spotify
  end
end
