# frozen_string_literal: true

require 'optparse'
require_relative 'lib/calc'
require_relative 'lib/input_calculator'
require_relative 'lib/files_calculator'

options = ARGV.getopts('l')
def exists_argv
  if !ARGV[0].nil?
    true
  else
    false
  end
end

def formatter_lopt(calc_results)
  calc_results.each do |row|
    print row[:lines].to_s.rjust(8)
    puts " #{row[:filename]}"
  end
end

def formatter_not_lopt(calc_results)
  calc_results.each do |row|
    print row[:lines].to_s.rjust(8)
    print row[:words].to_s.rjust(8)
    print row[:bytes].to_s.rjust(8)
    puts " #{row[:filename]}"
  end
end

def call(option)
  if exists_argv
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
