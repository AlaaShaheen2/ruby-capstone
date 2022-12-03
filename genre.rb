class Genre
  attr_accessor :name, :id, :items

  def initialize(name, items = [])
    @id = Random.rand(1..200)
    @name = name
    @items = items
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
