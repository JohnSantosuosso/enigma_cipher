module Creatable

  def generate_new_key
    @key = (0..9).to_a.sample(5).join
  end

  def generate_new_date
    @date = Time.now.strftime('%m/%d/%Y').sub('20','')
    @date.gsub!('/', '').to_s[-4..-1]
  end

  def generate_alphabet
    @alphabet = Hash[('a'..'z').to_a.zip((1..26).to_a)]
    @alphabet[" "] = 27
  end

  def generate_shifts
    
  end


end
