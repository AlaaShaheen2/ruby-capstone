require '../books'
require '..label'

module BookModule
  include DataStorage

  def add_books
    load_storage('books')
    publish_date = ask_publish_date
    ask_archived
    cover_state = ask_cover_state
    publisher = ask_publisher
    book = Book.new(publisher, cover_state, publish_date)
    @books.push(book)
    book_data = { publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state,
                  archived: book.archived, id: Random.rand(1..100) }
    update_storage('books', book_data)
    load_storage('labels')
    title = ask_title
    color = ask_color
    label = Label.new(title, color)
    label_data = { title: label.title, color: label.color, id: Random.rand(1..100) }
    @labels.push(label)
    update_storage('labels', label_data)
    puts 'Book and its label created!'
    puts "\n"
  end

  def list_books
    books = load_storage('books')
    puts 'No book found!: ' if books.length.zero?
    books.each_with_index do |book, index|
      puts "#{index + 1}. Publish_date: #{book['publish_date']}, cover_state: #{book['cover_state']}",
           "Publisher: #{book['publisher']}, Archived: #{book['archived']}, ID: #{book['id']}"
    end
    puts "\n"
  end

  def list_label
    labels = load_storage('labels')
    puts 'No label found: ' if labels.length.zero?
    labels.each_with_index do |label, index|
      puts "#{index + 1}. Title: #{label['title']}, Color: #{label['color']}, ID: #{label['id']}"
    end
    puts "\n"
  end

  def ask_cover_state
    print 'Enter cover state: '
    gets.chomp
  end

  def ask_publisher
    print 'Publisher: '
    gets.chomp
  end

  def ask_publish_date
    puts 'Enter publish date'
    print 'Publish date [dd-mm-yyyy]: '
    gets.chomp
  end

  def ask_archived
    puts 'Is it already archived'
    print 'Is archived? [Yy/Nn]: '
    gets.chomp
  end

  def ask_title
    print 'Enter title: '
    gets.chomp
  end

  def ask_color
    print 'Enter color: '
    gets.chomp
  end
end
