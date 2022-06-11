require_relative '../modules/creatable'
require_relative 'enigma'

class Encryption
  include Creatable

  attr_accessor :message, :shifts, :formatted_message, :final_message_form

  def initialize(message,shifts) #how to pull these from enigma???
    @message = message
    @shifts = shifts
    @formatted_message = formatted_message
    @final_message_form = final_message_form
  end

  def run_encryption_on_message
    generate_formatted_message
    map_encrypt_shifts_to_characters
    format_numbers_outside_alphanumeric_range
    generate_alphanumeric_replacements
    generate_final_message_form
  end

  def map_encrypt_shifts_to_characters
    @formatted_message = @formatted_message.map! {|message| message.zip(@shifts)}.flatten(1)
    @formatted_message.map! {|set| set.include?(nil) ? [0, 0]: set}
    @formatted_message.map! {|values| values.sum}
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

end
