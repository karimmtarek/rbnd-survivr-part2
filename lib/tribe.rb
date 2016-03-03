class Tribe
  attr_accessor :name, :members

  def initialize(prob)
    @name = prob[:name]
    @members = prob[:members]
    puts "#{name.blue} tribe has been created!"
  end

  def tribal_council(immune: nil)
    members.reject { |member| member == immune }.sample
  end

  def to_s
    name
  end
end
