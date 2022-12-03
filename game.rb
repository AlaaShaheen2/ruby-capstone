require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_play

  def initialize(multiplayer, last_play, archived: false)
    super(archived: archived)
    @multiplayer = multiplayer
    @last_play = Date.parse(last_play)
  end

  def can_be_archived?
    check = Time.now.year - @last_play.year > 2

    archived && check
    false
  end
end
