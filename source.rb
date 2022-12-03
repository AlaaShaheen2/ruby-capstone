class Source
  attr_accessor :name, :id
  attr_reader  :items

  def initialize(name)
    @id = Random.rand(1..200)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
