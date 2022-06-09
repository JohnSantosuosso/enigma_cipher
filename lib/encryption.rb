require_relative '../modules/creatable'
require_relative 'enigma'

class Encryption
  include Creatable

  attr_accessor :message, :shifts, :formatted_message, :shifted_message, :final_message_form

  def initialize(message,shifts) #how to pull these from enigma???
    @message = message
    @shifts = shifts
    @formatted_message = formatted_message
    @shifted_message = shifted_message
    @final_message_form = final_message_form
  end

  def run_encryption_on_message
    add_shifts
    map_shifts_to_characters
    format_numbers_outside_alphanumeric_range
    map_alpha_numeric_location_to_alphabet
    convert_formatted_message_to_string
  end

  def add_shifts
    @formatted_message = @message.each_slice(4).to_a
  end

  def map_shifts_to_characters
    @formatted_message = @formatted_message.map! {|message| message.zip(@shifts)}.flatten(1).map! {|values| values.sum}
  end

  def format_numbers_outside_alphanumeric_range
    @formatted_message = @formatted_message.map!{|number|
      if number > 27
          while number >= 27
          number -= 27
          end
        number
      else
        number
      end}
  end

  def map_alpha_numeric_location_to_alphabet
    generate_alphabet
    @formatted_message = @formatted_message.map! {|number| @alphabet.key(number)}
  end

  def convert_formatted_message_to_string
    @final_message_form = @formatted_message.join
  end

  def finish
    @final_message_form
  end

end
