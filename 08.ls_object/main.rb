# frozen_string_literal: true

require 'etc'
require 'optparse'
require_relative './lib/file_finder'
require_relative './lib/long_formatter'
require_relative './lib/normal_formatter'

options = ARGV.getopts('a', 'l', 'r')
file_finder = FileFinder.new(options)
files = file_finder.find_files

formatter = options['l'] ? LongFormatter.new(files) : NormalFormatter.new(files)
formatter.output_files
