module Creatable

  def generate_new_key
    @key = (0..9).to_a.sample(5).join
  end

end
