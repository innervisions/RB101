arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

new_arr = arr.map do |sub_arr|
  sub_arr.select { |num| num % 3 == 0 }
end

p arr
p new_arr
