# frozen_string_literal: true

require 'etc'
require 'optparse'
require_relative './lib/ls_file'
require_relative './lib/long_format'
require_relative './lib/normal_format'

# lオプションのフォーマット

options = ARGV.getopts('a', 'l', 'r')
lscommand = LsFile.new(options)
files = lscommand.gets_files

if options['l']
  long = LongFormat.new(files)
  long.option_l_total
  long.options_l
else
  format = NormalFormat.new(files)
  format.output_3_arrays
end
