require_relative 'enigma'

class Decryption
    include Creatable
    attr_accessor :message, :shifts, :formatted_message, :final_message_form

  def initialize(message, shifts)
    @message = message
    @shifts = shifts
    @formatted_message = formatted_message
    @final_message_form = final_message_form
  end


end
