# frozen_string_literal: true

class Calc
  def calc_lines(str)
    str.count("\n")
  end

  def calc_words(str)
    str.split(/\s/).count { |w| !w.empty? }
  end

  def calc_bytes(str)
    str.bytesize
  end
end
