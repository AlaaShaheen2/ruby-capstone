require '../books'

describe Book do
  before :each do
    @book = Book.new(' Robert C. Martin
    Latest Edition', 'Clean Code', '12-04-2009')
  end

  it 'Return the book' do
    expect(@book).to allow_instance_of Book
  end

  it 'The publisher for the book' do
    expect(@book.publisher).to equal 'Elsiever'
  end

  it 'The title for the book is' do
    expect(@book.cover_state).to equal 'Clean Code'
  end

  it 'The book published at ' do
    expect(@book.publish_date.strftime('%d-%m-%Y')).to equal('12-04-2009')
  end

  it 'Book should not be archived' do
    expect(@book.archived).to equal false
  end

  it 'The id for the book' do
    expect(@book.id).to be_kind_of Integer
  end
end
