# frozen_string_literal: true

require 'etc'
require 'optparse'
require_relative './lib/ls_file'
require_relative './lib/long_format'
require_relative './lib/normal_format'

options = ARGV.getopts('a', 'l', 'r')
ls_file = LsFile.new(options)
files = ls_file.gets_files

if options['l']
  long_format = LongFormat.new(files)
  long_format.combine_loption_method
else
  normal_format = NormalFormat.new(files)
  normal_format.output_file_table
end
