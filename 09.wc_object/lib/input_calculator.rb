# frozen_string_literal: true

require_relative 'calculator'
class InputCalculator
  def initialize(option, input)
    @option = option
    @input = input.join
  end

  def call
    calculator = Calculator.new(@input)
    lines = calculator.lines
    words = calculator.words unless @option['l']
    bytes = calculator.bytes unless @option['l']
    [lines: lines, words: words, bytes: bytes]
  end
end
