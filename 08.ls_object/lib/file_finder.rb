# frozen_string_literal: true

class FileFinder
  def initialize(options)
    @options = options
  end

  def find_files
    files = @options['a'] ? Dir.glob('*', File::FNM_DOTMATCH) : Dir.glob('*')
    @options['r'] ? files.sort.reverse : files.sort
  end
end
