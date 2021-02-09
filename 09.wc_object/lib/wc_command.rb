# frozen_string_literal: true

class WcCommand
  def check_argv
    !ARGV[0].nil?
  end

  def run_wc(option)
    if check_argv
      wc_files = WcFiles.new(option)
      wc_files.run
    else
      wc_input = WcInput.new(option)
      wc_input.run
    end
  end
end
