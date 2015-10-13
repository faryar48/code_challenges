v = [6, 9, 4, 7, 4, 1]
d = 3 

def find_deviation(v, d)
  all_medians = []
  v.each_slice(d) do |array|
    median = (array.reduce(:+))/ d 
    all_medians << median
  end 
  p all_medians.max
end

find_deviation(v, d)