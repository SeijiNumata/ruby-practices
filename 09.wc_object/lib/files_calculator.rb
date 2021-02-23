# frozen_string_literal: true

require_relative 'calc'
class FilesCalculator
  def initialize(option, input)
    @option = option
    @input = input
  end

  def call
    files = validate_and_get_file(@input)
    table = []

    files.each do |filename|
      file_contents = File.open(filename).read
      row = calc_depend_opt(file_contents)
      row[:filename] = filename
      table << row
    end
    table << calc_total(table) if files.size >= 2
    table
  end

  private

  def calc_total(table)
    total_lines = 0
    total_words = 0
    total_bytes = 0

    table.each do |field|
      total_lines += field[:lines]
      total_words += field[:words] unless @option['l']
      total_bytes += field[:bytes] unless @option['l']
    end
    if @option['l']
      { lines: total_lines, filename: 'total' }
    else
      { lines: total_lines, words: total_words, bytes: total_bytes, filename: 'total' }
    end
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
    calc = Calc.new(str)
    lines = calc.lines
    if @option['l']
      row = { lines: lines.to_i }
    else
      words = calc.words
      bytes = calc.bytes
      row = { lines: lines, words: words, bytes: bytes }
    end
    row
  end
end
