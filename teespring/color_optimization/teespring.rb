
# my efforts on making the hex to decimal method myself...don't think it works

def hex2bin(hexadecimal)
  hash = {
    'a' => 10,
    'b' => 11,
    'c' => 12,
    'd' => 13,
    'e' => 14,
    'f' => 15
  }

  x = 0
  binary_array = []
  array = hexadecimal.split('')
  answer = []
  array.reverse.each_with_index do |hex,i|
    if hash.keys.include? hex
      hex = hash[hex]
    else
      hex
    end
    until 2 ** x > hex.to_i do
      binary_array << 2 ** x
      x += 1
    end

    batch = []
    binary_array.reverse.each do |binary|
      remainder = hex.to_i / binary.to_i
      batch << remainder
      hex = hex.to_i - binary.to_i if hex.to_i > 1
    end
    if batch.length < 4
      batch.unshift 0 until batch.length == 4
    end
    answer << batch.join
  end
  final_answer = []
  answer.reverse.each_slice(4) do |slice|
    final_answer << slice
  end
  if final_answer[0][0].include? "0"
    final_answer[0][0].sub!(/^[0]*/,"")
  end
  final_answer.flatten.join
end

def bin2dec(binary)
  # turning it into an array
  array = binary.split('')
  sum = 0
  array.reverse.each_with_index do |x,i|
    # taking each number in reverse order and raising it to the power of 2 ^ index
    sum += x.to_i * (2 ** i)
  end
  # returning the sum
  sum
end

def hex2dec(hexadecimal)
  hex_array = splithex(hexadecimal)
  decimal_array = []
  hex_array.each do |color|
    binary = hex2bin(color)
    decimal_array.push(bin2dec(binary))
  end
  decimal_array
end

def splithex(hex)
  red = hex[0..1]
  green = hex[2..3]
  blue = hex[4..5]
  rgb_array = [red, green, blue]
end



p hex2dec('90A14F')
p hex2dec('1916A2')
p hex2dec('FFFFFF')

p hex2bin('90A14F')
p hex2bin('1916A2')
p hex2bin('FFFFFF')



describe "turning a hexadecimal to a binary number" do
  it "returns the correct binary number" do
    expect(hex2bin('90A14F')).to eq('1001 0000 1010 0001 0100 1111')
  end

  it "returns the correct binary number" do
    expect(hex2bin('1916A2')).to eq('0001 1001 0001 0110 1010 0010')
  end

  it "returns the correct binary number" do
    expect(hex2bin('FFFFFF')).to eq('1111 1111 1111 1111 1111 1111')
  end

end

describe "turning a binary number to a decimal number" do
  it "returns the correct decimal number" do
    expect(bin2dec('100100000000000101000000')).to eq(9478479)
  end

  it "returns the correct decimal number" do
    expect(bin2dec('110010001011000000010')).to eq(1644034)
  end

  it "returns the correct decimal number" do
    expect(bin2dec('00000000000000000000')).to eq(0)
  end

end









