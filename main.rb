require_relative './app'
def menu
    @options = [
        '1 - List all books',
        '2 - List all labels',
        '3 - List all music albums',
        '4 - List all genres',
        '5 - List all games',
        '6 - List all authors',
        '7 - Add a book',
        '8 - Add a music album',
        '9 - Add a game',
        '10 - Exit the App'
        ]

    puts "\nPlease choose an option by entering a number:"
    puts @options
end

def option_case(choice, app)
    case choice
    when 1
        app.list_all_books
      when 2
        app.list_all_labels
      when 3
        app.list_all_music_albums
      when 4
        app.list_all_genres
      when 5
        app.list_all_games
      when 6
        app.list_all_authors
    when 7
        app.add_book
    when 8
        app.add_music_album
    when 9
        app.add_game
    else
      puts 'Incorrect choice, choose a number between 1..10'
    end
  end

  def prompt_user(app)
    menu
    print "Enter choice:"
    choice = gets.chomp.to_i
    choice == 10 ? app.quit_app : option_case(choice, app)
  
    prompt_user (app)
  end

  def main
    puts "\n* * * * * * * * * * * * * * * * * * *"
    puts "\n*  Welcome to Catalog of my things App!   *"
    puts "\n* * * * * * * * * * * * * * * * * * *"
    app = App.new
    prompt_user(app)
  end
  
  main