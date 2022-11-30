require_relative './app'
def menu
  @options = [
    '1 - List all books',
    '2 - List all music albums',
    '3 - List all movies',
    '4 - List all games',
    '5 - List all genres',
    '6 - List all labels',
    '7 - List all authors',
    '8 - List all sources',
    '9 - Add a book',
    '10 - Add a music album',
    '11 - Add a movie',
    '12 - Add a game',
    '13 - Exit the App'
  ]

  puts "\nPlease choose an option by entering a number:"
  puts @options
end

def option_case(choice, app)
  case choice
  when 1
    app.list_all_books
  when 2
    app.list_all_music_albums
  when 3
    app.list_all_movies
  when 4
    app.list_all_games
  when 5
    app.list_all_genres
  when 6
    app.list_all_labels
  when 7
    app.list_all_authors
  when 8
    app.list_all_sources
  when 9
    app.add_book
  when 10
    app.add_music_album
  when 11
    app.add_movie
  when 12
    app.add_game
  else
    puts 'Incorrect choice, choose a number between 1..12'
  end
end

def prompt_user(app)
  menu
  print 'Enter choice:'
  choice = gets.chomp.to_i
  choice == 13 ? app.quit_app : option_case(choice, app)

  prompt_user(app)
end

def main
  puts "\n* * * * * * * * * * * * * * * * * * *"
  puts "\n*  Welcome to Catalog of my things App!   *"
  puts "\n* * * * * * * * * * * * * * * * * * *"
  app = App.new
  prompt_user(app)
end

main
