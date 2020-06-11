puts "Type something to count words in: "

text = gets.chomp.downcase!
text = text.gsub!(/[^A-Za-z ]/, '') #This removes punctuation

words = text.split

frequencies = Hash.new(0)

words.each { |word| 
	frequencies[word] += 1 }

frequencies = frequencies.sort_by {|word, count|
  count}

frequencies.reverse!

frequencies.each {|word, count| 
    puts word + " " + count.to_s}
