class Label
  attr_reader :id, :items, :title, :color

  def initialize(title, color, items = [])
    @id = Random.rand(1..200)
    @title = title
    @color = color
    @items = items
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
