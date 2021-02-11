# frozen_string_literal: true

require 'optparse'
require_relative './lib/calc'
require_relative './lib/input_calculator'
require_relative './lib/wc_command'
require_relative './lib/files_calculator'

options = ARGV.getopts('l')
wc_command = WcCommand.new
wc_command.run_wc(options)
