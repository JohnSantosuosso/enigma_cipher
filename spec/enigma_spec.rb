require './enigma.rb'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  describe "#initialize" do
    it 'is an instance of Enigma' do
      expect(@enigma).to be_instance_of(Enigma)
    end
  end

  it 'returns the same key when provided' do
    @enigma.key_check("02715")
    expect(@enigma.key).to eql("02715")
    expect(@enigma.key).to be_a(String)
  end

  it 'generates a new key when key is not provided' do
    @enigma.key_check(nil)
    expect(@enigma.key).not_to eql(nil)
    expect(@enigma.key).to be_a(String)
  end

end
