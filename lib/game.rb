class Game
  attr_accessor :tribes

  def initialize(tribe_1, tribe_2)
    @tribes = [tribe_1, tribe_2]
  end

  def add_tribe(tribe)
    tribes << tribe
  end

  def immunity_challenge
    tribes.sample
  end

  def individual_immunity_challenge
    tribe = immunity_challenge
    immune = tribe.members.sample
    voted_off = tribe.members.delete(tribe.tribal_council(immune: immune))
    voted_off
  end

  def clear_tribes
    self.tribes = []
  end

  def merge(new_tribe_name)
    new_tribe = Tribe.new(name: new_tribe_name, members: merge_tribes_members)
    clear_tribes
    tribes << new_tribe
    new_tribe
  end

  def merge_tribes_members
    new_tribe_members = []
    tribes.each do |tribe|
      new_tribe_members += tribe.members
    end
    new_tribe_members
  end
end
