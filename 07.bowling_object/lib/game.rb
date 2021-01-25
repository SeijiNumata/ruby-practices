# frozen_string_literal: true

class Game
  attr_accessor :point, :frames, :shots, :input

  def initialize(input)
    @input = input
    @point = 0
  end

  def input_to_shot
    @shots = @input.split('')
    @shots = @shots.map do |shot|
      Shot.new(shot)
    end
  end

  def shots_to_frames
    frames = []
    frame = []
    @shots.each do |s|
      frame << s

      if frames.size < 10
        if frame.size >= 2 || s.shot == 10
          frames << frame.dup
          frame.clear
        end
      else # last frame
        frames.last << s
      end
    end
    @frames = frames.map do |one_frame|
      Frame.new(one_frame)
    end
  end

  def calc_point
    zero_shot = Shot.new(0) # 最終フレーム計算時に、空のshotオブジェクトが必要
    nil_frame = []
    nil_frame << zero_shot
    nil_frame << zero_shot
    (0..9).each do |n|
      frame, next_frame, after_next_frame = @frames.slice(n, 3)

      next_frame ||= Frame.new(nil_frame) # 最終フレームの対応
      next_frame.frame_score_array

      after_next_frame ||= Frame.new(nil_frame)
      after_next_frame.frame_score_array

      left_shots = next_frame.frame_shots + after_next_frame.frame_shots
      @point += if frame.calc_strike         
                  frame.frame_shots.sum + left_shots.slice(0, 2).sum
                elsif frame.calc_spare
                  frame.frame_shots.sum + left_shots.fetch(0)
                else
                  frame.frame_shots.sum

                end
    end
    @point
  end
end
