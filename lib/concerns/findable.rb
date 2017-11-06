module Concerns
  module Findable

  def find_by_name(name)
    self.all.each do |x|
      if x.name == name
        return x
      end
    end
    false
  end

  def find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

end

end
