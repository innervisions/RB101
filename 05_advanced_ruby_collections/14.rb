hsh = {
  'grape' => { type: 'fruit', colors: ['red', 'green'], size: 'small' },
  'carrot' => { type: 'vegetable', colors: ['orange'], size: 'medium' },
  'apple' => { type: 'fruit', colors: ['red', 'green'], size: 'medium' },
  'apricot' => { type: 'fruit', colors: ['orange'], size: 'medium' },
  'marrow' => { type: 'vegetable', colors: ['green'], size: 'large' }
}

result = hsh.map do |_, info|
  if info[:type] == 'fruit'
    info[:colors].map(&:capitalize)
  elsif info[:type] == 'vegetable'
    info[:size].upcase
  end
end
p result
