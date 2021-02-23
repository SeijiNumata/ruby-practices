# frozen_string_literal: true

require_relative 'calc'
class InputCalculator
  def initialize(option, input)
    @option = option
    @input = input.join
  end

  def call
    calc = Calc.new(@input)
    lines = calc.lines
    words = calc.words unless @option['l']
    bytes = calc.bytes unless @option['l']
    [lines: lines, words: words, bytes: bytes]
  end
end
