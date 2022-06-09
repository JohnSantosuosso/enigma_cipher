require_relative '../modules/creatable'
require_relative 'encryption'

class Enigma
  include Creatable

  attr_accessor :key, :date, :shifts, :message, :encryption, :encrypted_message

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
    @encrypted_message = @encryption.finish
    output = {encrypt: @encrypted_message, key: @key, date: @date}
    output
  end

  def initiate_encryption
    @encryption = Encryption.new(@message,@shifts)
  end


end
