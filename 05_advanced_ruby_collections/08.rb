hsh = { first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'],
        fourth: ['over', 'the', 'lazy', 'dog'] }

hsh.each do |_, arr|
  arr.each do |str|
    str.each_char do |char|
      puts char if 'aeiou'.include?(char)
    end
  end
end
