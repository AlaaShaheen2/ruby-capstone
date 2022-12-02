require_relative './item'

class Book < Item
  attr_reader :publisher, :cover_state, :archived, :id

  def initialize(publisher, cover_state, publish_date, archived)
    super(publish_date, archived: archived)
    @id = Random.rand(1..1000)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    true if super || cover_state == 'bad'
    false
  end
end