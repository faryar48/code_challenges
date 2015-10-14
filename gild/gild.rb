# Your program should find the top five queries entered by the users and print them all - separated by a newline.

# To give you an example of the output printed by your program:

# many hardships
# artificial intelligence
# apple pie
# a million dollars


# Filename: our-cool-service.log

query_names = {}

File.open('data.txt', 'r') do |f|
  f.each_line do |line|
    line = line.split("query=")
    line = line[1].split("]\n") if line[1] != nil
    if query_names[line]
      query_names[line] += 1
    else
      query_names[line] = 0
    end
  end
end

p query_names.sort_by { |_, v| -v }.first(5).map(&:first)

