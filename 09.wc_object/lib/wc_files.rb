# frozen_string_literal: true

class WcFiles
  def initialize(option)
    @option = option
  end

  def check_and_get_file(isfiles)
    isfiles.each_with_index do |arg, i|
      if File.directory?(arg) == true || File.exist?(arg) == false
        puts "#{isfiles[i]}: No such file or directory"
        exit
      end
      isfiles
    end
  end

  def open_and_read_files(str)
    File.open(str).read
  end

  def calc_depend_opt(str)
    calc = Calc.new
    lines = calc.calc_lines(str)
    if @option['l']
      [lines.to_i]
    else
      words = calc.calc_words(str)
      bytes = calc.calc_bytes(str)
      [lines.to_i, words.to_i, bytes.to_i]
    end
  end

  # 出力
  def run
    files = check_and_get_file(ARGV)
    table = []

    files.each do |file|
      file_contents = open_and_read_files(file)
      row = calc_depend_opt(file_contents)
      row.each do |field|
        print field.to_s.rjust(8)
      end
      table << row
      puts " #{file}"
    end

    return unless files.size >= 2

    totals = table.transpose
    totals.each do |total|
      print total.sum.to_s.rjust(8)
    end
    puts ' total'
  end
end
