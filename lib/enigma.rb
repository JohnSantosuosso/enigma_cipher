require_relative '../modules/creatable'

class Enigma
  include Creatable

  attr_accessor :key, :date

  def initialize
    @key = key
    @date = date
  end

  def encrypt(message, key=nil, date=nil)
    key_check(key)
    date_check(date)
  end

  def key_check(key)
    key.nil? == true ? generate_new_key : @key = key
  end

  def date_check(date)
    date.nil? == true ? generate_new_date : @date = date
  end

end
