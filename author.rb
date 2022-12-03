class Author
  # getters and setters
  attr_reader  :items
  attr_accessor :first_name, :last_name, :id

  def initialize(first_name, last_name)
    @id = Random.rand(1..200)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  # add item method
  def add_item(item)
    @items << item
    item.author = self
  end
end
