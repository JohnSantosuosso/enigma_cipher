require_relative '../modules/creatable'
require_relative 'encryption'
require_relative 'decryption'

class Enigma
  include Creatable

  attr_accessor :key, :date, :shifts, :message, :encryption, :encrypted_message, :decryption, :decrypted_message, :encrypted, :decrypted

  def initialize
    @key = key
    @date = date
    @message = message
    @shifts = shifts
  end

  def encrypt(message, key=nil, date=nil)
    generate_key(key)
    generate_date(date)
    generate_message(message)
    generate_shifts
    initiate_encryption
    @encryption.run_encryption_on_message
    @encrypted_message = @encryption.final_message_form
    @encrypted = {encryption: @encrypted_message, key: @key, date: @date}
    @encrypted
  end

  def decrypt(message, key=nil, date=nil)
    generate_key(key)
    generate_date(date)
    generate_message(message)
    generate_shifts
    initiate_decryption
    @decryption.run_decryption_on_message
    @decrypted_message = @decryption.final_message_form
    @decrypted = {decrypt: @decrypted_message, key: @key, date: @date}
    @decrypted
  end

  def initiate_encryption
    @encryption = Encryption.new(@message,@shifts)
  end

  def initiate_decryption
    @decryption = Decryption.new(@message,@shifts)
  end

end
