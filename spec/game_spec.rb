require_relative '../game'

describe 'Testing the game class implementation' do
  before(:each) do
    @games = Game.new(true, '12-12-2021')
  end
end
