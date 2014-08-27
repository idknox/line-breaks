require "line_breaker"
require "fileutils"
require "tempfile"

class Textformatter
  def initialize(opened_file)
    @opened_file = opened_file
  end

  def format_lines
    tmp = Tempfile.new("temp")
    @opened_file.each_line do |line|
      formatted_line = Linebreaker.new(line).break
      tmp << formatted_line
    end
    tmp.close
    FileUtils.mv(tmp.path, "./output/#{@opened_file.path.split("/").last}")
  end
end