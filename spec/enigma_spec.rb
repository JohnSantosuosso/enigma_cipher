require './lib/enigma'
require './lib/encryption'

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
    @enigma.date = "040895"
    @enigma.generate_shifts
    expect(@enigma.shifts).to eql([3, 27, 73, 20])
    expect(@enigma.shifts).to be_a(Array)
  end

  it 'generates the numeric index of each character in a message from a message' do
    @enigma.generate_message("Hello World")
    expect(@enigma.message).to eql([8, 5, 12, 12, 15, 27, 23, 15, 18, 12, 4])
    expect(@enigma.message).to be_a(Array)
  end

  it 'initiates the Encryption class' do
    @enigma.initiate_encryption
    expect(@enigma.encryption).to be_instance_of(Encryption)
  end

  it 'encrypts a message' do
    expect(@enigma.encrypt("hello world", "02715", "040895")).to eql({:date=>"040895", :encryption=>"keder ohulw", :key=>"02715"})
  end

  it 'decrypts a message' do
    expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eql({:date=>"040895", :decryption=> "hello world", :key=>"02715"})
  end

#Need mocks/subs for all of the following below:

  xit 'encrypts a message with todays date' do
    expect(@enigma.decrypt("keder ohulw", "02715")).to eql({:date=>"040895", :decryption=> "hello world", :key=>"02715"})
  end

  xit 'encrypts a message with todays date' do
    expect(@enigma.encrypt("hello world", "02715")).to eql({:date=>"040895", :encryption=>"keder ohulw", :key=>"02715"})
  end

  xit 'encrypts a message with no key or date' do
    expect(@enigma.encrypt("hello world")).to eql({:date=>"040895", :encryption=>"keder ohulw", :key=>"02715"})
  end


end
