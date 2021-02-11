# frozen_string_literal: true

class InputCalculator
  def initialize(option)
    @option = option
  end

  def run
    inputs = $stdin.readlines
    calc = Calc.new
    print   calc.calc_lines(inputs.join).to_s.rjust(8)
    print   calc.calc_words(inputs.join).to_s.rjust(8) unless @option['l']
    print   calc.calc_bytes(inputs.join).to_s.rjust(8) unless @option['l']
    puts
  end
end
