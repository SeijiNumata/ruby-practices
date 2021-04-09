# frozen_string_literal: true

require 'optparse'
require_relative 'lib/wc'

options = ARGV.getopts('l')

puts Wc.new.call(options)
