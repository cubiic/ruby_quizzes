# Devise a function that gets one parameter 'word' and returns all the anagrams for 'w' from the
# file wl.txt.
# 
# "Anagram": An anagram is a type of word play, the result of rearranging the letters of a word or
# phrase to produce a new word or phrase, using all the original letters exactly once; for example
# orchestra can be rearranged into carthorse.
# 
# anagrams("horse") should return:
# ['heros', 'horse', 'shore']


require 'benchmark'

# Solution 1:
def anagram_1(word)
  dictionary = File.open('./wl.txt').readlines("\n").collect(&:chomp) 
  dictionary_array = dictionary.collect { |w| w.chars.sort }

  as_array = word.chars.sort

  matching = []
  dictionary_array.each_with_index{ |dictw, i| matching << i if dictw == as_array }
  matching.collect{ |i| dictionary[i] }
end

puts "Test for anagram 1:"
puts "'zulu':        #{anagram_1 'zulu'}"
puts "'horse':       #{anagram_1 'horse'}"
puts "'admits':      #{anagram_1 'admits'}"
puts "'adolescence': #{anagram_1 'adolescence'}"
puts '-------------------'

# Solution 2:
def anagram_2(word)
  dictionary = File.open('./wl.txt').readlines("\n").collect(&:chomp) 
  dictionary_array = dictionary.collect { |w| w.chars.sort }

  as_array = word.chars.sort

  matching = []
  finding = 0
  word_position = 0
  while finding do
    finding = dictionary_array.slice(word_position, dictionary_array.length).index(as_array)
    if finding
      word_position += finding
      matching << dictionary[word_position]
      word_position += 1
    end
  end
  matching
end

puts "Test for anagram 2:"
puts "'zulu':        #{anagram_2 'zulu'}"
puts "'horse':       #{anagram_2 'horse'}"
puts "'admits':      #{anagram_2 'admits'}"
puts "'adolescence': #{anagram_2 'adolescence'}"
puts
puts '-------------------'

puts 'Benchmarks:'
puts
puts "zulu:"
Benchmark.bm do |x|
  x.report(:func1) do
    anagram_1 'zulu'
  end
  x.report(:func2) do
    anagram_2 'zulu'
  end
end

puts "horse:"
Benchmark.bm do |x|
  x.report(:func1) do
    anagram_1 'horse'
  end
  x.report(:func2) do
    anagram_2 'horse'
  end
end

puts "admits:"
Benchmark.bm do |x|
  x.report(:func1) do
    anagram_1 'admits'
  end
  x.report(:func2) do
    anagram_2 'admits'
  end
end

puts "adolescence:"
Benchmark.bm do |x|
  x.report(:func1) do
    anagram_1 'adolescence'
  end
  x.report(:func2) do
    anagram_2 'adolescence'
  end
end

# Example run (Ruby 2.0.0):

# zulu
#        user       system     total       real
# func1  0.120000   0.000000   0.120000 (  0.120233)
# func2  0.110000   0.010000   0.120000 (  0.109811)

# horse
#        user       system     total       real
# func1  0.100000   0.000000   0.100000 (  0.107238)
# func2  0.100000   0.000000   0.100000 (  0.105489)

# admits
#        user       system     total       real
# func1  0.100000   0.000000   0.100000 (  0.100590)
# func2  0.090000   0.010000   0.100000 (  0.094516)

# adolescence
#        user       system     total       real
# func1  0.090000   0.000000   0.090000 (  0.090912)
# func2  0.120000   0.010000   0.130000 (  0.131855)

# So it looks like anagram_2 is in general faster, while anagram_1 performs better with long words without anagrams.
