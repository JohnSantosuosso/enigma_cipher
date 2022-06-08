require_relative '../modules/creatable'

class Enigma
  include Creatable

  attr_accessor :date, :key

  def initialize
    @date = date
    @key = key
  end

  def encrypt(message, key=nil, date=nil)
    key_check(key)
  end

  def key_check(key)
    key.nil? == true ? generate_new_key : @key = key
  end

end
