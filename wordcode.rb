book_text = "I am Sam
Sam I am
That Sam-I-am!
That Sam-I-am!
I do not like that Sam-I-am!
Do you like
green eggs and ham?
I do not like them, Sam-I-am.
I do not like
green eggs and ham.
Would you like them
here or there?
I would not like them
here or there.
I would not like them anywhere.
I do not like
green eggs and ham.
I do not like them, Sam-I-am.
Would you like them in a house?
Would you like them with a mouse?
I do not like them
in a house.
I do not like them
with a mouse.
I do not like them
here or there.
I do not like them
anywhere.
I do not like
green eggs and ham.
I do not like them,
Sam-I-am.
Would you eat them
in a box?
Would you eat them
with a fox?
Not in a box.
Not with a fox.
Not in a house.
Not with a mouse.
I would not eat them
here or there.
I would not eat them anywhere.
I would not eat green eggs and ham.
I do not like them, Sam-I-am."

## returns an array of numbers -- each word corresponds to a code.

def generate_code(str)
  word_arr = str.split(" ")
  word_arr_simple = str.downcase.split(" ").each {|x| x.gsub!(/\W+/, '')}

  word_hash = {}
  counter = 1

  word_arr_simple.each do |word|
    if word_hash[word] != nil
    else
     word_hash[word] = counter
     counter += 1
    end
  end

  $new_array = []

  word_arr_simple.each_with_index do |word, index|
    $new_array << [word_arr[index], word_hash[word]]
  end

  # $new_array = word_arr_simple.map{|x| [x, word_hash[x]]}

end

generate_code(book_text)

##creates a csv with the words and the code

require 'csv'
CSV.open("wordfile.csv", "w", :write_headers=> true,
    :headers => ["word","code"]) do |csv|
  $new_array.each do |row_array|
    csv << row_array
  end
end

