require_relative '../modules/creatable'

class Encryption
  include Creatable

  attr_accessor :shifts

  def initialize
    @shifts = shifts
  end

  def run_encryption(message, key, date)
  end



end
