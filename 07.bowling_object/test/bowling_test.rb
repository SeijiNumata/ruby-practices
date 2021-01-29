# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../bowling'

class BowlingTest < Minitest::Test
  def test_bowling
    game1 = Game.new('6390038273X9180X645')
    assert_equal 139, game1.calc_game_points

    game2 = Game.new('6390038273X9180XXXX')
    assert_equal 164, game2.calc_game_points

    game3 = Game.new('0X150000XXX518104')
    assert_equal 107, game3.calc_game_points

    game4 = Game.new('6390038273X9180XX00')
    assert_equal 134, game4.calc_game_points

    game5 = Game.new('XXXXXXXXXXXX')
    assert_equal 300, game5.calc_game_points
  end
end
