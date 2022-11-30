require './item'

class MusicAlbum < Item
    attr_accessor :on_spotify

    def initialize(on_spotify, publish_date, archived: false)
        super(publish_date, archived: false)
        @on_spotify = on_spotify
    end

    private
    def can_be_archived?
        super and @on_spotify
      end
    end
