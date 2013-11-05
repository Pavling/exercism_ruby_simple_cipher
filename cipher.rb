class Cipher

  def initialize(key)
    @key = key
  end

  def key
    @key ||= generate_random_key
  end

  private
  def generate_random_key
    (0...100).map { (97 + rand(26)).chr }.join
  end

end