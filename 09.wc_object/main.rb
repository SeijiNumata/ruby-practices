# frozen_string_literal: true

require 'optparse'
require_relative './lib/calc'
require_relative './lib/wc_input'
require_relative './lib/wc_command'
require_relative './lib/wc_files'

options = ARGV.getopts('l')
wc_command = WcCommand.new
wc_command.run_wc(options)
