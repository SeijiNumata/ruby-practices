# frozen_string_literal: true

class LongFormatter
  PERMISSION_TABLE = { 0 => '---', 1 => '--x', 2 => '-w-', 3 => '-wx', 4 => 'r--', 5 => 'r-x', 6 => 'rw-',
                       7 => 'rwx' }.freeze
  FTYPE_TABLE = { 'file' => '-', 'directory' => 'd', 'link' => 'l' }.freeze

  def initialize(files)
    @files = files
  end

  def output_files
    output_total
    output_for_option_l
  end

  private

  def output_total
    total = @files.sum { |file| File.stat(file).blocks.to_i }
    puts "total #{total}"
  end

  def get_ftype(file)
    ftype = File.ftype(file)
    FTYPE_TABLE[ftype]
  end

  def get_permission(file, digits)
    int_permittion = File.stat(file).mode.to_s(8).to_i % 1000
    PERMISSION_TABLE[int_permittion.digits[digits]]
  end

  def output_for_option_l
    @files.each do |file|
      print get_ftype(file)
      print get_permission(file, 2)
      print get_permission(file, 1)
      print get_permission(file, 0)
      print File.stat(file).nlink.to_s.rjust(3)
      print Etc.getpwuid(File.stat(file).uid).name.rjust(12)
      print Etc.getgrgid(File.stat(file).gid).name.to_s.rjust(7)
      print File.stat(file).size.to_s.rjust(6)
      print " #{File.stat(file).mtime.strftime(' %-m %e %H:%M')} "
      puts file.to_s
    end
  end
end
