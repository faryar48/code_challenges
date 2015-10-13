
require 'json'

class Ink
  attr_accessor :id, :color, :cost, :volume

  def initialize(value)
    @color = value['color']
    @cost = value['cost']
    @volume = value['volume']
  end

  def red
    color[0..1].hex
  end

  def green
    color[2..3].hex
  end

  def blue
    color[4..5].hex
  end

  def closest_inks
    INKS.select do |key, value|
      total_distance(value) <= 330
    end
  end

  # measures the euclidean distance
  def total_distance(value)
    delta_red = (value.red - red).abs
    delta_green = (value.green - green).abs
    delta_blue = (value.blue - blue).abs
    Math.sqrt(delta_blue ** 2 + delta_green ** 2 + delta_red ** 2)
  end

  # old method that took cost into account but there was a VERY large color disparity, wish i had more time to link up color and cost with all of the colors we got
  # def best_ink
  #   closest_inks.min_by do |key, ink|
  #     ink.cost
  #   end
  # end

  # after realizing that the total color disparity accounts for multiple inks in the sample file, this method below gives us a much better score (although it no longer takes the cost into consideration...)
  def best_ink
    closest_inks.min_by do |key, ink|
      total_distance(ink)
    end
  end
end

str_from_stdin = STDIN.read
file = File.read('inks.json')

data_hash = JSON.parse(file)
INKS = {}
data_hash.each do |key, value|
  INKS[key] = Ink.new(value)
end

hex_array = []
str_from_stdin.split(/\t|\n/).each do |word|
  hex_array.push(word)
end

inks_array = []
hex_array.each_with_index do |item, index|
  inks_array.push(item) if (index % 2 == 0)
end

inks_array.each do |hex|
  new_ink = Ink.new({'color' => hex})
  puts new_ink.best_ink.first
end

# in the process of writing tests but ran out of time :(
# describe "finding the closest ink color based on the euclidean distance" do
#   it "returns a hash of the colors from the json file based on the euc distance" do
#     expect(closest_inks).to eq()
#   end
# end

# describe "measure the euclidean distance" do
#   it "measures the euclidean distance based on a certain value that its given" do
#     expect(total_distance()).to eq()
#   end
# end

# describe "separates the colors correctly and turns them into a hex" do
#   it "separates red from the original hex and turns it into a hex" do
#     expect(red).to eq()
#   end

#   it "separates green from the original hex and turns it into a hex" do
#     expect(green).to eq()
#   end

#   it "separates blue from the original hex and turns it into a hex" do
#     expect(blue).to eq()
#   end

# end

# describe "after it gets an array from closest_inks, chooses the cheapest ink from the set" do
#   it "returns the cheapest ink for the certain color that was given" do
#     expect(best_ink).to eq()
#   end
# end

