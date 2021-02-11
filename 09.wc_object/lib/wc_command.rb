# frozen_string_literal: true

class WcCommand
  def check_argv
    !ARGV[0].nil?
  end

  def run_wc(option)
    calculator = check_argv ? FilesCalculator.new(option) : InputCalculator.new(option)
    calculator.run
  end
end
