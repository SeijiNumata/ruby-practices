# frozen_string_literal: true

# 欲しいファイルを渡すクラス
class LsFile
  def initialize(options)
    @options = options
  end

  # オプションによって欲しいファイルを渡す
  def gets_files
    files = []
    if @options['a']
      Dir.foreach('.') do |item|
        files.push(item)
      end
    else
      Dir.foreach('.') do |item|
        next if item == '.' || item == '..' || item.start_with?('.') # 隠しファイルを排除する

        files.push(item)
      end
    end
    @options['r'] ? files.sort.reverse : files.sort
  end
end
