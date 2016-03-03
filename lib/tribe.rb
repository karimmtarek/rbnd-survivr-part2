class Tribe
  attr_reader :name, :members

  def initialize(options)
    @name = options[:name]
    @members = options[:members]
    puts "#{name.blue} tribe has been created!"
  end

  def tribal_council(immune: nil)
    members.reject { |member| member == immune }.sample
  end

  def to_s
    name
  end
end
