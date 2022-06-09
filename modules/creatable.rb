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
def generate_message(message)
  generate_alphabet
  split_message = message.downcase.chars
  @message = split_message.map! {|letter| @alphabet[letter]}
end

#Shift creatables--break this method up
  def generate_shifts
    keys = []
    @key.chars.each_cons(2){|num| keys << num}
    dates = (@date.to_i ** 2).to_s[-4..-1].chars
    keys.map! {|key| key.join}
    dates.map!{|date| date.to_i}
    keys.map!{|key| key.to_i}
    @shifts = keys.zip(dates)
    @shifts.map!{|shift| shift.sum}
    require "pry"; binding.pry
  end

end
