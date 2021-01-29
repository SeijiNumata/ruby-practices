# frozen_string_literal: true

require_relative './lib/game'
require_relative './lib/frame'
require_relative './lib/shot'

input = ARGV[0]
game1 = Game.new(input)
puts game1.calc_game_points
