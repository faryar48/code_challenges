
s = "We test coders. Give us a try?"

def solution(s)
  word_count_array = []
  sentences = s.split(/\?/)
  sentences.each do |sentence|
    word_count = sentence.split(" ").length 
    word_count_array << word_count
  end 
  p word_count_array.max 
end 

p solution(s)


# NOT COMPLETELY CORRECT