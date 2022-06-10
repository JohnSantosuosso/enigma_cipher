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

end
