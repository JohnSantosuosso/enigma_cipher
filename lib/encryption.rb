require_relative '../modules/creatable'
require_relative 'enigma'

class Encryption
  include Creatable

  attr_accessor :message, :shifts, :formatted_message, :shifted_message #dry with variable names

  def initialize(message,shifts) #how to pull these from enigma???
    @message = message
    @shifts = shifts
    @formatted_message = formatted_message
    @shifted_message = shifted_message
  end

  def add_shifts
    @formatted_message = @message.each_slice(4).to_a
  end

  def map_shifts_to_characters()
    @formatted_message = @formatted_message.map! {|message| message.zip(@shifts)}.flatten(1).map! {|values| values.sum}
  end


end
