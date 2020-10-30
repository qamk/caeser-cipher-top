require "pry" 

def caeser_cipher(text,key)
  punctuation = ["!",",",".","?"," ","'",":"]
  text_array = text.strip.split("")
  is_punctuation = -> (char) {punctuation.include?(char) ? true: false}
  # useful as %26 defines the "group" of legitimate characters (A-Z, a-z)
  shift_wrap = -> (char_code, case_code) {((char_code - case_code)%26)+case_code}


  cipher = text_array.map do |char|
    # easier way to ignore punctuation and continue the map function
    (is_punctuation.call(char)) ? (next(char)) : char_code = (char.ord)

    # binding.pry
    shifted_code = char_code+key

    if char_code.between?(65,90)
      cipher_code = shift_wrap.call(shifted_code,65)
      next(cipher_code.chr)

    elsif char_code.between?(97,122)
      cipher_code = shift_wrap.call(shifted_code,97)
      next(cipher_code.chr)

    end


  end
  return cipher.join("")

end

puts "Enter your text to put through the Caeser cipher:"
user_text = gets.chomp
puts "Enter your key for the cipher (integer)"
key = gets.chomp.to_i
puts "Result: #{caeser_cipher(user_text,key)}"