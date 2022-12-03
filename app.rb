require_relative './files/create_books'
require './files/game_mod'
require_relative './files/create_author'
require_relative './files/music_mod'

class App
  include GameModule
  include Storage
  include BookModule
  include MusicModule
  include ReadMusic
  include WriteMusic
  include ReadGenre
  include WriteGenre

  def initialize
    @books = []
    @labels = []
    @source = []
    @music_album = read_list
    @games = []
    @genre = read_genre
    @authors = []
  end

  def run
    app_menu
  end

  def list_all_books
    list_books
  end

  def list_all_music_albums
    music_list
  end

  def list_of_games
    list_game
  end

  def list_all_genres
    show_genres
  end

  def list_all_labels
    list_label
  end

  def list_all_authors
    list_authors
  end

  def list_all_sources
    puts 'List_all_sources'
  end

  def add_a_book
    add_books
  end

  def add_a_music_album
    add_a_music
  end

  def add_a_game
    add_game
  end
end
