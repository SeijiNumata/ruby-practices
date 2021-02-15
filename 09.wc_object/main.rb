# frozen_string_literal: true

require 'optparse'
require_relative 'lib/calc'
require_relative 'lib/input_calculator'
require_relative 'lib/files_calculator'

options = ARGV.getopts('l')
def is_exists_argv
  if !ARGV[0].nil?
    true
  else
    false
  end
end

def formatter_lopt(calc_results)
  puts calc_results[0].to_s.rjust(8) if calc_results.length == 1

  calc_results.slice(0..-3).each_with_index do |calc_result, index|
    if index.odd?
      puts calc_result.to_s.rjust(calc_result.to_s.length + 1)
    else
      print calc_result.to_s.rjust(8)
    end
    puts ' total' if index + 1 == calc_results.slice(0..-3).length
  end

  if calc_results.length == 2
    print calc_results[0].to_s.rjust(8)
    puts calc_results[1].to_s.rjust(calc_results[1].to_s.length + 1)
    nil
  end

  return unless calc_results.length == 3

  print calc_result[0].to_s.rjust(8)
  print calc_result[1].to_s.rjust(8)
  puts calc_result[2].to_s.rjust(8)
end

def formatter_not_lopt(calc_results)
  count = 0
  input_flag = 1 if calc_results.length == 3
  calc_results.each_with_index do |calc_result, index|
    count += 1
    if index % 4 == 3
      print calc_result.to_s.rjust(calc_result.to_s.length + 1)
    else
      print calc_result.to_s.rjust(8)
    end
    puts if (count % 4).zero?
  end
  puts ' total' if calc_results.length >= 8
  puts if input_flag == 1
end

def call(option)
  if is_exists_argv
    calculator = FilesCalculator.new(option)
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

call(options)
