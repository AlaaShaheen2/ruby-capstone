require_relative './genre'
require_relative './author'
require_relative './source'
require_relative './label'
require_relative './music_album'
require_relative './display'
require_relative './file/store_data'

class App
  attr_reader :sources, :labels, :genres, :authors, :music_albums

  def initialize
    @labels = []
    @sources = []
    @genres = []
    @authors = []
    @music_albums = []
  end

  def add_label(item_type)
    print "Title of the #{item_type}: "
    title = gets.chomp
    print "Color of the #{item_type}: "
    color = gets.chomp
    Label.new(title, color)
  end

  def add_genre(item_type)
    print "#{item_type} genre: "
    genre_name = gets.chomp
    Genre.new(genre_name)
  end

  def add_source(item_type)
    print "#{item_type} source (e.g. 'From a friend', 'Online shop'): "
    source_name = gets.chomp
    Source.new(source_name)
  end

  def add_author(item_type)
    puts "#{item_type} author"
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end

  def on_spotify?
    print 'Is the Music Album on Spotify? [Y/N]: '
    is_spotify = gets.chomp.downcase
    case is_spotify
    when 'y'
      true
    when 'n'
      false
    else
      puts 'Invalid Selection. Please enter \'y\', \'Y\' or \'n\', \'N\'!'
      on_spotify?
    end
  end

  def add_music_album
    on_spotify = on_spotify?
    print 'Date published ? (yyyy/mm/dd) (e.g 2001/01/12): '
    published_date = gets.chomp
    album = MusicAlbum.new(on_spotify, published_date)
    label = add_label('Music Album')
    genre = add_genre('Music Album')
    source = add_source('Music Album')
    singer = add_author('Music Album')
    puts "\n Music Album created successfully \n \n"
    label.add_item(album)
    genre.add_item(album)
    singer.add_item(album)
    source.add_item(album)

    @music_albums << album
    @labels << label
    @genres << genre
    @authors << singer
    @sources << source

    puts "\n '#{label.title}' by #{singer.first_name} #{singer.last_name} was added successfully!"
  end

  def quit_app
    # it is here that we r going to persist data to files
    StoreData.store_source(@sources)
    StoreData.store_labels(@labels)
    StoreData.store_genres(@genres)
    StoreData.store_authors(@authors)
    StoreData.store_music_albums(@music_albums)
    puts 'Thank you for using this app! Now exiting...'
    exit
  end

  def list_all_authors
    Display.list_all_authors(@authors)
  end

  def list_all_genres
    Display.list_all_genres(@genres)
  end

  def list_all_labels
    Display.list_all_labels(@labels)
  end

  def list_all_sources
    Display.list_all_sources(@sources)
  end

  def list_all_music_albums
    Display.list_all_music_albums(@music_albums)
  end
end
