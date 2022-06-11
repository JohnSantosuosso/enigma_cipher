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

  def run_decryption_on_message
    generate_formatted_message
    map_decrypt_shifts_to_characters
    format_negative_numbers
    format_zeroes
    generate_alphanumeric_replacements
    generate_final_message_form
  end

  def map_decrypt_shifts_to_characters
    @formatted_message = @formatted_message.map! {|message| message.zip(@shifts)}.flatten(1)
    @formatted_message.map! {|set| set.include?(nil) ? [nil]: set}
    @formatted_message.map! {|values| values != [nil] ? values[0]-values[1] : nil }
  end

  def format_negative_numbers
    @formatted_message = @formatted_message.map! do |number|
      if number != nil && number < 0
        number%27
      elsif number != nil && number >=0
        number
      elsif number == nil
        nil
      end
    end
  end

    def format_zeroes
      @formatted_message.map! {|number| number == 0 ? -1 : number}
      format_negative_numbers
    end

end
