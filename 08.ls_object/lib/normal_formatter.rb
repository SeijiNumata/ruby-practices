# frozen_string_literal: true

class NormalFormatter
  COLUMN = 3
  BLANK = 7

  attr_accessor :files

  def initialize(files)
    @files = files
    @max_length = @files.max_by(&:size).length
  end

  def output_files
    row_count = (files.count.to_f / COLUMN).ceil
    transposed_filenames = safe_transpose(files.each_slice(row_count).to_a)

    transposed_filenames.map do |row_file|
      puts row_file.map { |filename| filename.to_s.ljust(@max_length + BLANK) }.join
    end
  end

  private

  def safe_transpose(nested_file_names)
    nested_file_names[0].zip(*nested_file_names[1..-1])
  end
end
