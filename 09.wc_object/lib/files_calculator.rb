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
        table << field
      end
      table << filename
    end
    calc_total(table) if files.size >= 2
    table
  end

  private

  def calc_total(table)
    l = 0
    w = 0
    b = 0
    table.each_with_index do |field, index|
      if (index % 4).zero?
        l += field
      elsif index % 4 == 1
        w += field unless field.is_a?(String)
      elsif index % 4 == 2
        b += field unless field.is_a?(String)
      end
    end
    table << l
    table << w
    table << b
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
