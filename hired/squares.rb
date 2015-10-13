


def solution(a, b)
    squares_array = []
    (a..b).each do |num| 
        answer = Math.sqrt(num)
        if answer == answer.to_i  
            squares_array << num
        end
    end
    p squares_array.length 
end

solution(4, 17)