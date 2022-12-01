require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played

  def initialize(multiplayer, last_played, archived:false)
    super(archived:archived)
    @multiplayer = multiplayer
    @last_played_date = Date.parse(last_played)
  end

 