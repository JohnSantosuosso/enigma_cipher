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
  end

  it 'is an instance of Encryption' do
    expect(@encryption1).to be_instance_of(Encryption)
  end

  it 'declares a new variable that contains the grouped formatted message' do
    @encryption1.add_shifts
    expect(@encryption1.formatted_message).to eql([[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]])
  end

  it 'maps the shifts to the formatted message' do
    @encryption1.formatted_message = [[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]]
    @encryption1.map_shifts_to_characters
    expect(@encryption1.formatted_message).to eql([10, 14, 20, 18, 17, 36, 31, 21, 20, 21, 12])
  end

  it 'accounts for values greater than 27' do
    @encryption1.formatted_message = [[8, 5, 12, 12], [15, 27, 23, 15], [18, 12, 4]]
    @encryption1.map_shifts_to_characters
  end

  # xit 'is an instance of Encryption' do
  #   @message = [8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4]
  #   @encryption.run_encryption([8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4], "040895")
  #   expect(@encryption.alphabet.count).to eql(27)
  # end

end
