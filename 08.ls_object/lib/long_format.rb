# frozen_string_literal: true

class LongFormat
  def initialize(files)
    @files = files
  end

  def option_l_total
    blocks = 0
    @files.each do |file|
      stat = File.stat(file)
      blocks += stat.blocks.to_i
    end
    puts "total #{blocks}" # ブロック数
  end

  def options_l
    @files.each do |file| # ファイルごとの処理
      stat = File.stat(file)
      ftype = File.ftype(file) # ファイルタイプ
      ftype_table = { 'file' => '-', 'directory' => 'd', 'link' => 'l' }
      print ftype_table[ftype]
      int_permittion = stat.mode.to_s(8).to_i % 1000 # permissionを８進数にする
      permission_table = { 0 => '---', 1 => '--x', 2 => '-w-', 3 => '-wx', 4 => 'r--', 5 => 'r-x', 6 => 'rw-',
                           7 => 'rwx' }
      print permission_table[int_permittion.digits[2]]
      print permission_table[int_permittion.digits[1]]
      print "#{permission_table[int_permittion.digits[0]]} "
      print stat.nlink.to_s.rjust(2) # ハードリンクの数
      print "\s#{Etc.getpwuid(stat.uid).name} ".rjust(12) # ユーザー名
      print Etc.getgrgid(stat.gid).name.to_s.rjust(6) # グループ名
      print stat.size.to_s.rjust(5) # size
      mtime = stat.mtime # 更新日時
      print "\s#{mtime.strftime('%m %d %H:%M')} "
      puts file.to_s # ファイル名
    end
  end
end
