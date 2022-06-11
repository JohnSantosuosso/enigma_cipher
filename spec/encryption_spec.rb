require './lib/enigma'
require './lib/encryption'

RSpec.describe Encryption do
  before(:each) do
    @enigma = Enigma.new
    @enigma.key = "02715"
    @enigma.date = "011000"
    @enigma.message = [8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4]
    @enigma.initiate_encryption
  end

  it 'is an instance of Encryption' do
    expect(@enigma.encryption).to be_instance_of(Encryption)
  end

  it 'receives a message when initialized' do
    expect(@enigma.encryption.message).to eql([8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4])
  end

  before(:each) do
    @encryption1 = Encryption.new([8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4],[2, 9, 8, 6] )
    @encryption2 = Encryption.new([8, 5, 12, "!", 15, 27, ",", 15, 18, "!", 4],[2, 9, 8, 6] )
  end

  it 'is an instance of Encryption' do
    expect(@encryption1).to be_instance_of(Encryption)
    expect(@encryption2).to be_instance_of(Encryption)
  end

  it 'generates a new variable that contains the grouped formatted message' do
    @encryption1.generate_formatted_message
    @encryption2.generate_formatted_message
    expect(@encryption1.formatted_message).to eql([[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]])
    expect(@encryption2.formatted_message).to eql([[8, 5, 12, "!"], [15, 27, ",", 15], [18, "!", 4]])
  end

  it 'maps the formatted message using the shift passed at instantiation' do
    @encryption1.formatted_message = [[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]]
    @encryption2.formatted_message = [[8, 5, 12, "!"], [15, 27, ",", 15], [18, "!", 4]]
    @encryption1.map_encrypt_shifts_to_characters
    @encryption2.map_encrypt_shifts_to_characters
    expect(@encryption1.formatted_message).to eql([10, 14, 20, 18, 17, 36, 31, 21, 20, 21, 12])
    expect(@encryption2.formatted_message).to eql([10, 14, 20, "!", 17, 36, ",", 21, 20, "!", 12])
  end

  it 'maps the formatted message using the shift passed at instantiation, accounting for values greater than 27' do
    @encryption1.formatted_message = [[8, 50, 120, 12], [15, 270, 23, 15], [180, 12, 4]]
    @encryption2.formatted_message = [[8, 50, 120, "!"], [15, 270, ",", 15], [180, "!", 4]]
    @encryption1.map_encrypt_shifts_to_characters
    @encryption1.format_numbers_outside_alphanumeric_range
    @encryption2.map_encrypt_shifts_to_characters
    @encryption2.format_numbers_outside_alphanumeric_range
    expect(@encryption1.formatted_message).to eql([10, 5, 20, 18, 17, 9, 4, 21, 20, 21, 12])
    expect(@encryption2.formatted_message).to eql([10, 5, 20, "!", 17, 9, ",", 21, 20, "!", 12])
  end

  it 'maps the alpha numeric location to the alphabet Hash' do
    @encryption1.formatted_message = [[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]]
    @encryption2.formatted_message = [[8, "!", 12, 12], [">", 27, 23, "$"], [18, "$", 4]]
    @encryption1.map_encrypt_shifts_to_characters
    @encryption1.format_numbers_outside_alphanumeric_range
    @encryption1.generate_alphanumeric_replacements
    @encryption2.map_encrypt_shifts_to_characters
    @encryption2.format_numbers_outside_alphanumeric_range
    @encryption2.generate_alphanumeric_replacements
    expect(@encryption1.formatted_message).to eql(["j", "n", "t", "r", "q", "i", "d", "u", "t", "u", "l"])
    expect(@encryption2.formatted_message).to eql(["j", "!", "t", "r", ">", "i", "d", "$", "t", "$", "l"])
  end

  it 'turns formatted message array into a single string' do
    @encryption1.formatted_message = ["j", "n", "t", "r", "q", "i", "d", "u", "t", "u", "l"]
    @encryption2.formatted_message = ["j", "!", "t", "r", ">", "i", "d", "$", "t", "$", "l"]
    @encryption1.generate_final_message_form
    @encryption2.generate_final_message_form
    expect(@encryption1.final_message_form).to eql("jntrqidutul")
    expect(@encryption2.final_message_form).to eql("j!tr>id$t$l")
  end

end
