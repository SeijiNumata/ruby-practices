# frozen_string_literal: true

require './lib/game'
require './lib/frame'
require './lib/shot'

def calc_game_points(game)
  game.input_to_shot # 全てのshotインスタンスを生成、shotsに格納
  game.shots_to_frames # frameインスタンス生成 @framesに格納

  game.frames.each do |frame| # frameインスタンスごとに、point計算に必要なものを計算
    frame.frame_score_array
    frame.calc_strike
    frame.calc_spare
  end

  game.calc_point
  game.point
end

input = ARGV[0]

game1 = Game.new(input)
puts calc_game_points(game1)
