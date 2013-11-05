class Cipher

  def initialize(key)
    @key = key
  end

  def key
    @key ||= generate_random_key
  end

  def encode(plaintext)
    plaintext.chars.each_with_index.map do |char, index|
      (((key[index % key.length].ord - 97) % 26) + char.ord).chr
    end.join
  end

  def decode(ciphertext)
    ciphertext.chars.each_with_index.map do |char, index|
      (char.ord - ((key[index % key.length].ord - 97) % 26)).chr
    end.join
  end

  private
  def generate_random_key
    (0...100).map { (97 + rand(26)).chr }.join
  end

end