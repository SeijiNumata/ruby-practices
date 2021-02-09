# frozen_string_literal: true

class LongFormat
  PERMISSION_TABLE = { 0 => '---', 1 => '--x', 2 => '-w-', 3 => '-wx', 4 => 'r--', 5 => 'r-x', 6 => 'rw-',
                       7 => 'rwx' }.freeze

  def initialize(files)
    @files = files
  end

  def output_option_l_total
    blocks = 0
    @files.each do |file|
      stat = File.stat(file)
      blocks += stat.blocks.to_i
    end
    puts "total #{blocks}"
  end

  def get_stat(file)
    File.stat(file)
  end

  def get_ftype(file)
    ftype = File.ftype(file)
    ftype_table = { 'file' => '-', 'directory' => 'd', 'link' => 'l' }
    ftype_table[ftype]
  end

  def get_permission(file, digits)
    int_permittion = get_stat(file).mode.to_s(8).to_i % 1000
    PERMISSION_TABLE[int_permittion.digits[digits]]
  end

  def output_options_l
    @files.each do |file|
      print get_ftype(file)
      print get_permission(file, 2)
      print get_permission(file, 1)
      print "#{get_permission(file, 0)} "
      print get_stat(file).nlink.to_s.rjust(2)
      print "\s#{Etc.getpwuid(get_stat(file).uid).name} ".rjust(13)
      print Etc.getgrgid(get_stat(file).gid).name.to_s.rjust(6)
      print get_stat(file).size.to_s.rjust(6)
      print "\s#{get_stat(file).mtime.strftime(' %-m %e %H:%M')} "
      puts file.to_s
    end
  end

  def combine_loption_method
    output_option_l_total
    output_options_l
  end
end
