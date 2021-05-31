# frozen_string_literal: true

require 'optparse'
require_relative 'lib/wc'

options = ARGV.getopts('l')

puts WcCommand::Wc.new.call(options)
