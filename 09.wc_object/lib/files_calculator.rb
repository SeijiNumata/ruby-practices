# frozen_string_literal: true

class FilesCalculator
  def initialize(option)
    @option = option
  end

  def run
    files = validate_and_get_file(ARGV)
    table = []

    files.each do |filename|
      file_contents = File.open(filename).read
      row = calc_depend_opt(file_contents)
      row.each do |field|
        print field.to_s.rjust(8)
      end
      puts " #{filename}"
      table << row
    end

    output_total(table) if files.size >= 2
  end

  private

  def output_total(table)
    totals = table.transpose
    totals.each do |total|
      print total.sum.to_s.rjust(8)
    end
    puts ' total'
  end

  def validate_and_get_file(isfiles)
    isfiles.each_with_index do |arg, i|
      if File.directory?(arg) == true || File.exist?(arg) == false
        puts "#{isfiles[i]}: No such file or directory"
        exit
      end
      isfiles
    end
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
end
