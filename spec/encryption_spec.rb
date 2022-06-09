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
    expect(@encryption).to be_instance_of(Encryption)
  end

  it 'receives a message when initialized' do
    expect(@enigma.encryption.message).to eql([8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4])
  end

  before(:each) do
    @encryption = Encryption.new([8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4], [2, 9, 8, 6])
  end

  it 'is an instance of Encryption' do
    expect(@encryption).to be_instance_of(Encryption)
  end

  # xit 'is an instance of Encryption' do
  #   @message = [8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4]
  #   @encryption.run_encryption([8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4], "040895")
  #   expect(@encryption.alphabet.count).to eql(27)
  # end

end
