class Item
  # attribute readers
  attr_reader :id, :publish_date, :archived

  # constructor
  def initialize(publish_date: Time.now, archived: false)
    @id = Random.rand(1..200)
    @publish_date = publish_date
    @archived = archived
  end

  # public methds
  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  # private methos
  private

  def can_be_archived?
    current = Time.now.year - publish_date.year.to_i
    true if current > 10
  end
end
