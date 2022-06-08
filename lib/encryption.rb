require_relative '../modules/creatable'
require_relative '../modules/shiftable'

class Encryption
  include Shiftable
  include Creatable

  attr_accessor :alphabet

  def initialize
    #@alphabet = alphabet
  end

  def run_encryption(message, key, date)
    generate_alphabet
    generate_shifts
  end

end
