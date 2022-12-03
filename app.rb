require_relative './author'
require_relative './books'
require_relative './game'
require_relative './label'
require_relative './music_album'
require_relative './item'

class App
  def initialize()
    @books = []
    @games = []
    @music_albums = []
    @movies = []
  end

  def run
    BookData.load_book_data(@books)
    GamesData.load_games(@games)
    MusicAlbumsData.load_music_data(@music_albums)
    MovieData.load_movie_data(@movies)
    InfoData.load_info_data(@books, @games, @movies, @music_albums)
    user_input = 0
    puts "####\nWelcome to the Catalog App!\n####"
    while user_input != '13'
      puts "Choose a number from the options below:\n"
      app_options
      print 'Enter Option [number]: '
      user_input = gets.chomp
      puts "\n"
      check_selection(user_input)
    end
    puts "Exiting, thanks for using this app!\n\n" if user_input == '13'
    BookData.save_book_data(@books)
    GamesData.save_games(@games)
    MusicAlbumsData.save_music_data(@music_albums)
    MovieData.save_movie_data(@movies)
  end
end
