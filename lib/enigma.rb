require_relative '../modules/creatable'
#require_relative 'encryption'

class Enigma
  include Creatable

  attr_accessor :key, :date, :shifts, :message, :encryption

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
    #@encryption.add_shifts #left off working on encryption methods
    #@encryption.finish
  end

  def initiate_encryption
    @encryption = Encryption.new(@message,@shifts)
  end

end
