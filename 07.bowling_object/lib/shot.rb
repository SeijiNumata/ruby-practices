# frozen_string_literal: true

class Shot
  attr_accessor :shot

  def initialize(shot)
    @shot = shot
    @shot = convert_int
  end

  def convert_int
    @shot = @shot == 'X' ? 10 : @shot.to_i
  end
end
