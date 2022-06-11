require './lib/enigma'
require './lib/decryption'

RSpec.describe Decryption do
  before(:each) do
    @enigma = Enigma.new
    @enigma.key = "02715"
    @enigma.date = "011000"
    @enigma.message = [8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4]
    @enigma.initiate_decryption
  end

  it 'is an instance of Decryption' do
    expect(@enigma.decryption).to be_instance_of(Decryption)
  end

  before(:each) do
    @decryption1 = Decryption.new([8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4],[2, 9, 8, 6] )
    @decryption2 = Decryption.new([8, 5, 12, "!", 15, 27, ",", 15, 18, "!", 4],[2, 9, 8, 6] )
  end

  it 'groups the array into a formatted message in preparation for mapping' do
    @decryption1.generate_formatted_message
    @decryption2.generate_formatted_message
    expect(@decryption1.formatted_message).to eql([[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]])
    expect(@decryption2.formatted_message).to eql([[8, 5, 12, "!"], [15, 27, ",", 15],[18, "!", 4]])
    expect(@decryption1.formatted_message.class).to eql(Array)
    expect(@decryption2.formatted_message.class).to eql(Array)
  end

  it 'maps the shifts to the formatted message' do
    @decryption1.formatted_message = [[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]]
    @decryption2.formatted_message = [[8, 5, 12, "!"], [15, 27, ",", 15],[18, "!", 4]]
    @decryption1.map_decrypt_shifts_to_characters
    @decryption2.map_decrypt_shifts_to_characters
    expect(@decryption1.formatted_message).to eql([6, -4, 4, 6, 13, 18, 15, 9, 16, 3, -4])
    expect(@decryption2.formatted_message).to eql([6, -4, 4, "!", 13, 18, ",", 9, 16, "!", -4])
    expect(@decryption1.formatted_message.class).to eql(Array)
    expect(@decryption2.formatted_message.class).to eql(Array)
  end

  it 'accounts for negative values' do
    @decryption1.formatted_message = [[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]]
    @decryption2.formatted_message = [[8, 5, 12, "!"], [15, 27, ",", 15],[18, "!", 4]]
    @decryption1.map_decrypt_shifts_to_characters
    @decryption1.format_negative_numbers
    @decryption2.map_decrypt_shifts_to_characters
    @decryption2.format_negative_numbers
    expect(@decryption1.formatted_message).to eql([6, 23, 4, 6, 13, 18, 15, 9, 16, 3, 23])
    expect(@decryption2.formatted_message).to eql([6, 23, 4, "!", 13, 18, ",", 9, 16, "!", 23])
    expect(@decryption1.formatted_message.class).to eql(Array)
    expect(@decryption2.formatted_message.class).to eql(Array)
  end

  it 'maps alpha numeric location to alphabet' do
    @decryption1.formatted_message = [[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]]
    @decryption2.formatted_message = [[8, 5, 12, "!"], [15, 27, ",", 15],[18, "!", 4]]
    @decryption1.map_decrypt_shifts_to_characters
    @decryption1.format_negative_numbers
    @decryption1.generate_alphanumeric_replacements
    @decryption2.map_decrypt_shifts_to_characters
    @decryption2.format_negative_numbers
    @decryption2.generate_alphanumeric_replacements
    expect(@decryption1.formatted_message).to eql(["f", "w", "d", "f", "m", "r", "o", "i", "p", "c", "w"])
    expect(@decryption2.formatted_message).to eql(["f", "w", "d", "!", "m", "r", ",", "i", "p", "!", "w"])
    expect(@decryption1.formatted_message.class).to eql(Array)
    expect(@decryption2.formatted_message.class).to eql(Array)
  end

  it 'turns formatted message array into a single string' do
    @decryption1.formatted_message = [[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]]
    @decryption2.formatted_message = [[8, 5, 12, "!"], [15, 27, ",", 15],[18, "!", 4]]
    @decryption1.map_decrypt_shifts_to_characters
    @decryption1.format_negative_numbers
    @decryption1.generate_alphanumeric_replacements
    @decryption1.generate_final_message_form
    @decryption2.map_decrypt_shifts_to_characters
    @decryption2.format_negative_numbers
    @decryption2.generate_alphanumeric_replacements
    @decryption2.generate_final_message_form
    expect(@decryption1.final_message_form).to eql("fwdfmroipcw")
    expect(@decryption2.final_message_form).to eql("fwd!mr,ip!w")
    expect(@decryption1.final_message_form.class).to eql(String)
    expect(@decryption2.final_message_form.class).to eql(String)
  end

end
