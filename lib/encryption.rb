require_relative '../modules/creatable'
require_relative 'enigma'

class Encryption
  include Creatable

  attr_accessor :message, :shifts, :formatted_message #dry with variable names

  def initialize(message,shifts) #how to pull these from enigma???
    @message = message
    @shifts = shifts
    @formatted_message = formatted_message
  end

  def add_shifts
    @formatted_message = @message.each_slice(4).to_a
    #left off here--need tests
  end

  def 

end
