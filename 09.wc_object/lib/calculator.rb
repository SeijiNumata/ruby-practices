# frozen_string_literal: true

class Calculator
  def initialize(str)
    @str = str
  end

  def lines
    @str.count("\n").to_i
  end

  def words
    @str.split(/\s/).count { |w| !w.empty? }.to_i
  end

  def bytes
    @str.bytesize.to_i
  end
end
