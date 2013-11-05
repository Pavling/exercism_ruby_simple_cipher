class Cipher

  def initialize(key)
    @key = key
    raise ArgumentError unless self.key[/[a-z]/]
  end

  def key
    @key ||= generate_random_key
  end

  def encode(plaintext)
    plaintext.chars.each_with_index.map do |char, index|
      char_code = ((key[index % key.length].ord - 97) % 26) + char.ord
      char_code = 97 + ((char_code - 97) % 26) if char_code > 122
      char_code.chr
    end.join
  end

  def decode(ciphertext)
    ciphertext.chars.each_with_index.map do |char, index|
      char_code = (char.ord - ((key[index % key.length].ord - 97) % 26))
      char_code = 122 - ((96 - char_code) % 26) if char_code < 97
      char_code.chr
    end.join
  end

  private
  def generate_random_key
    (0...100).map { (97 + rand(26)).chr }.join
  end
end
