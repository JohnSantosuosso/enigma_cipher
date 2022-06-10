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

  def add_shifts
    @formatted_message = @message.each_slice(4).to_a
  end

  def map_shifts_to_characters
    @formatted_message = @formatted_message.map! {|message| message.zip(@shifts)}.flatten(1).map! {|values| values[0]-values[1]}
  end

  def account_for_negative_values
  end


end
