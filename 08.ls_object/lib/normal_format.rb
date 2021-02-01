# frozen_string_literal: true

# lオプションではないフォーマット
class NormalFormat
  attr_accessor :files

  def initialize(files)
    @files = files
    max_length
  end

  # 一番長いファイルの文字数
  def max_length
    @max_length = @files.max_by(&:size).length
  end

  def output_3_arrays
    i = 0
    while i < files.sort.size % 3
      i += 1
      files << ''
    end
    number_of_files = files.size / 3
    output_array_files = @files.each_slice(number_of_files).to_a.transpose
    output_array_files.each do |array_file|
      array_file.each do |file|
        print file.ljust(@max_length + 3)
      end
      puts
    end
  end
end
