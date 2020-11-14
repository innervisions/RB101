produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(hsh)
  selected_pairs = {}
  counter = 0
  loop do
    key = hsh.keys[counter]
    value = hsh[key]
    selected_pairs[key] = value if value == 'Fruit'
    counter += 1
    break if counter == hsh.size
  end
  selected_pairs
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}
