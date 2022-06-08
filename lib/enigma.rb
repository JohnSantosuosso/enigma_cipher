require_relative '../modules/creatable'
require_relative '../modules/shiftable'
require_relative '../modules/alphabet'
require_relative '../lib/encryption'

class Enigma
  include Creatable

  attr_accessor :key, :date, :message, :encryption, :decryption

  def initialize
    @key = key
    @date = date
    @message = message
    @encryption = Encryption.new
    @decryption = Decryption.new
  end

  def encrypt(message, key=nil, date=nil)
    key_check(key)
    date_check(date)
    message_check(message)
    @encryption.run_encryption(message, @key, @date)
  end

  def key_check(key)
    key.nil? == true ? generate_new_key : @key = key
  end

  def date_check(date)
    date.nil? == true ? generate_new_date : @date = date
  end

end
