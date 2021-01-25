# frozen_string_literal: true

class Frame
  attr_accessor :frame, :frame_shots
  def initialize(frame)
    @frame = frame
  end

  def frame_score_array
    @frame_shots = @frame.map(&:shot)
  end

  def calc_strike
    #  @strike=@frame_shots[0] == 10 
    @frame_shots[0] == 10
  end

  def calc_spare
    # @spare=@frame_shots.sum == 10 && @strike == false
    @frame_shots.sum == 10 && !calc_strike
  end
end
