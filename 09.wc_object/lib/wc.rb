# frozen_string_literal: true

require_relative 'input_calculator'
require_relative 'files_calculator'

class Wc
  def call(option)
    if !ARGV[0].nil?
      calculator = FilesCalculator.new(option, ARGV)
    else
      input = $stdin.readlines
      calculator = InputCalculator.new(option, input)
    end
    if option['l'] == false
      formatter_not_lopt(calculator.call)
    else
      formatter_lopt(calculator.call)
    end
  end

  private

  def formatter_lopt(calculate_results)
    for_output_table = +''
    calculate_results.each do |row|
      for_output_table << row[:lines].to_s.rjust(8).to_s
      for_output_table << " #{row[:filename]}\n"
    end
    for_output_table
  end

  def formatter_not_lopt(calculate_results)
    for_output_table = +''
    calculate_results.each do |row|
      for_output_table << row[:lines].to_s.rjust(8)
      for_output_table << row[:words].to_s.rjust(8)
      for_output_table << row[:bytes].to_s.rjust(8)
      for_output_table << " #{row[:filename]}\n"
    end
    for_output_table
  end
end
