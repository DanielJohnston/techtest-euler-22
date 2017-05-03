require 'csv'
list = CSV.read('names.txt').flatten.sort
score = 0
offset = 'A'.ord - 1
list.each_with_index do |word, index|
  word_score = word.chars.reduce(0) { |total, letter| total + letter.ord }
  word_score -= offset * word.length
  score += word_score * (index + 1)
end
puts score
