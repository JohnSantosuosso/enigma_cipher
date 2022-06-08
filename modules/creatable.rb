module Creatable

#Key creatables
  def generate_key(key)
    key.nil? == true ? generate_new_key : @key = key
  end

  def generate_new_key
    @key = (0..9).to_a.sample(5).join
  end

#Date creatables
  def generate_date(date)
    date.nil? == true ? generate_new_date : @date = date
  end

  def generate_new_date
    @date = Time.now.strftime('%m/%d/%Y').sub('20','')
    @date.gsub!('/', '').to_s[-4..-1]
  end

#Alphabet creatables
  def generate_alphabet
    @alphabet = Hash[('a'..'z').to_a.zip((1..26).to_a)]
    @alphabet[" "] = 27
  end

#Message creatables
def generate_message
  @message
end

#Shift creatables
  def generate_shifts
    keys = []
    @key.chars.each_cons(2){|num| keys << num}
    dates = (@date.to_i ** 2).to_s[-4..-1].chars
    dates.map!{|date| date.to_i}
    keys.map!{|key| key.map!{|nums| nums.to_i}}
    keys.map!{|key| key.sum}
    @shift = keys.zip(dates)
    @shift.map!{|shift| shift.sum}
  end

end
