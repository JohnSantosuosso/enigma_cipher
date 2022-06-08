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

  it 'returns the same date when provided' do
    @enigma.date_check("040895")
    expect(@enigma.date).to eql("040895")
    expect(@enigma.date).to be_a(String)
  end

  it 'generates a new date when date is not provided' do
    @enigma.date_check(nil)
    expect(@enigma.date).not_to eql(nil)
    expect(@enigma.date).to be_a(String)
    expect(@enigma.date.length).to eql(6)
  end



end
