# frozen_string_literal: true

class InputCalculator
  def initialize(option, input)
    @option = option
    @input = input
  end

  def call
    calc = Calc.new
    lines = calc.calc_lines(@input.join)
    words = calc.calc_words(@input.join) unless @option['l']
    bytes = calc.calc_bytes(@input.join) unless @option['l']
    [lines: lines, words: words, bytes: bytes]
  end
end
