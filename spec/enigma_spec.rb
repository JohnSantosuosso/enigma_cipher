require './lib/enigma'

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
    @enigma.generate_key("02715")
    expect(@enigma.key).to eql("02715")
    expect(@enigma.key).to be_a(String)
  end

  it 'generates a new key when key is not provided' do
    @enigma.generate_key(nil)
    expect(@enigma.key).not_to eql(nil)
    expect(@enigma.key).to be_a(String)
  end

  it 'returns the same date when provided' do
    @enigma.generate_date("040895")
    expect(@enigma.date).to eql("040895")
    expect(@enigma.date).to be_a(String)
  end

  it 'generates a new date when date is not provided' do
    @enigma.generate_date(nil)
    expect(@enigma.date).not_to eql(nil)
    expect(@enigma.date).to be_a(String)
    expect(@enigma.date.length).to eql(6)
  end

  it 'generates a shift from a key' do
    @enigma.key = "02715"
    @enigma.date = "011000"
    @enigma.generate_shifts
    expect(@enigma.shift).to eql([2, 9, 8, 6])
    expect(@enigma.shift).to be_a(Array)
  end

  it 'generates a message from a message' do
    @enigma.generate_message("Hello World")
    expect(@enigma.message).to eql([8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4])
    expect(@enigma.message).to be_a(Array)
  end

end
