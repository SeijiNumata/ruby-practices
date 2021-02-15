# frozen_string_literal: true

class InputCalculator
  def initialize(option, input)
    @option = option
    @input = input
  end

  def run
    calc = Calc.new
    row = []
    row <<  calc.calc_lines(@input.join)
    row <<  calc.calc_words(@input.join) unless @option['l']
    row <<  calc.calc_bytes(@input.join) unless @option['l']
    row
  end
end
