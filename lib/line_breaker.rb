class Linebreaker
  def initialize(line)
    @line = line
  end

  attr_accessor :line

  def break
    char_count = 0
    line = @line.split("")

    line.each_with_index do |char, i|
      if char_count == 20 && line[i+1] == " "
        line.delete_at(i+1)
        line.insert(i+1, "\n")
        char_count = 1
      elsif char_count == 20 && line[i-1] == " "
        line.delete_at(i-1)
        line.insert(i-1, "\n")
        char_count = -1
      elsif char_count == 20
        insert_i = line[0..i].rindex(" ")
        line.delete_at(insert_i)
        line.insert(insert_i, "\n")
        char_count = i-insert_i
      else
        char_count += 1
      end
    end
    line.join("")
  end
end