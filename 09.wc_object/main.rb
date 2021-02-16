# frozen_string_literal: true

require 'optparse'
require_relative 'lib/wc'

options = ARGV.getopts('l')

wc = Wc.new
puts wc.call(options)
