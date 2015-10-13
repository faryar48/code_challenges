

first_words = ["cinema", "host", "aba", "train"]
second_words = ["iceman", "shot", "bab", "rain"]


def check_anagrams(first_words, second_words) 
  output = 0 
  first_words.each_with_index do |item, index|
    first_word = first_words[index].chars.sort 
    second_word = second_words[index].chars.sort 
    first_word == second_word ? output = 1 : output = 0 
    p output
  end
end  

check_anagrams(first_words, second_words)




