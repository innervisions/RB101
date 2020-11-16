arr = ['10', '11', '9', '7', '8']
sorted = arr.sort { |a, b| b.to_i <=> a.to_i }
# Alternative
# sorted = arr.sort_by(&:to_i).reverse
p arr
p sorted
