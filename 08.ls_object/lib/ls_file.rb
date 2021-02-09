# frozen_string_literal: true

class LsFile
  def initialize(options)
    @options = options
  end

  def gets_files
    files = @options['a'] ? Dir.glob('*', File::FNM_DOTMATCH) : Dir.glob('*')
    @options['r'] ? files.sort.reverse : files.sort
  end
end
