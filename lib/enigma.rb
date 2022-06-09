require_relative '../modules/creatable'
require_relative 'encryption'

class Enigma
  include Creatable

  attr_accessor :key, :date, :shift, :message, :encryption

  def initialize
    @key = key
    @date = date
    @message = message
    @shift = shift
    @encryption = Encryption.new
  end

  def encrypt(message, key=nil, date=nil)
    generate_key(key)
    generate_date(date)
    generate_message(message)
    generate_shifts
    @encryption.run_encryption(@message, @shifts)
  end

end
