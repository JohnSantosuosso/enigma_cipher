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
  end

  it 'groups the array into a formatted message in preparation for mapping' do
    @decryption1.generate_formatted_message
    expect(@decryption1.formatted_message).to eql([[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]])
  end

  it 'maps the shifts to the formatted message' do
    @decryption1.formatted_message = [[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]]
    @decryption1.map_decrypt_shifts_to_characters
    expect(@decryption1.formatted_message).to eql([6, -4, 4, 6, 13, 18, 15, 9, 16, 3, -4])
  end

  it 'accounts for negative values' do
    @decryption1.formatted_message = [[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]]
    @decryption1.map_decrypt_shifts_to_characters
    @decryption1.format_negative_numbers
    expect(@decryption1.formatted_message).to eql([6, 23, 4, 6, 13, 18, 15, 9, 16, 3, 23])
  end

end
