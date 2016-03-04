class Game
  attr_accessor :tribes

  def initialize(*tribes)
    @tribes = tribes
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
    tribes.clear
  end

  def merge(new_tribe_name)
    new_tribe = Tribe.new(name: new_tribe_name, members: merge_tribes_members)
    clear_tribes
    tribes << new_tribe
    new_tribe
  end

  def merge_tribes_members
    tribes.map(&:members).flatten
  end
end
