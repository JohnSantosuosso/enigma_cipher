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
