require "spec_helper"

describe "line breaker" do
  it "is instantiated with a single line string" do
    file = File.open("./data/awesome-sauce.txt", "r")
    file.each_line do |line|
      line_breaker = Linebreaker.new(line)
      expect(line_breaker.line).to eq(line)
    end
  end

  it "minimizes lines to 20 characters" do
    file = File.open("./data/awesome-sauce.txt", "r")
    file.each_line do |line|
      linebreaker = Linebreaker.new(line)
      puts linebreaker.break
    end
  end
end