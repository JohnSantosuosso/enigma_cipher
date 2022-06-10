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

  def map_decrypt_shifts_to_characters
    @formatted_message = @formatted_message.map! {|message| message.zip(@shifts)}.flatten(1).map! {|values| values[0]-values[1]}
  end

  def format_negative_numbers
    @formatted_message = @formatted_message.map!{|number|
      if number < 0
          while number <= 0
          number += 27
          end
        number
      else
        number
      end}
  end

end
