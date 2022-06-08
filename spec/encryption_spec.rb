require './lib/enigma'
require './lib/encryption'

RSpec.describe Encryption do
  before(:each) do
    @encryption = Encryption.new
  end

  it 'is an instance of Encryption' do
    expect(@encryption).to be_instance_of(Encryption)
  end

  it 'is an instance of Encryption' do
    @encryption.run_encryption("hello world", "02715", "040895")
    expect(@encryption.alphabet.count).to eql(27)
  end

end
