require 'colorizer'
require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# # Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
#
# # Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
#
# # Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
#=========================================================

# This is where you will write your code for the three phases
def phase_one
  8.times do
    voted_off = @borneo.individual_immunity_challenge
    puts "#{voted_off.name.red} was voted off the island"
  end
end

def phase_two
  3.times do
    voted_off = @borneo.individual_immunity_challenge
    puts "#{voted_off.name.red} was voted off the island"
  end
end

def phase_three
  7.times do
    voted_off = @borneo.individual_immunity_challenge
    puts "#{voted_off.name.red} was voted off the island"
    @jury.add_member(voted_off)
  end
end

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
puts ""
puts "*************"
puts "* Phase One *"
puts "*************"
phase_one #8 eliminations
puts ""
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
puts ""
puts "*************"
puts "* Phase Two *"
puts "*************"
phase_two #3 more eliminations
@jury = Jury.new

puts ""
puts "***************"
puts "* Phase Three *"
puts "***************"
phase_three #7 elminiations become jury members
finalists = @merge_tribe.members #set finalists

puts ""
puts "**************"
puts "* Cast votes *"
puts "**************"
vote_results = @jury.cast_votes(finalists) #Jury members report votes

puts ""
puts "****************"
puts "* Votes report *"
puts "****************"
@jury.report_votes(vote_results) #Jury announces their votes

puts ""
puts "*******************"
puts "* Winner! Winner! *"
puts "*******************"
@jury.announce_winner(vote_results) #Jury announces final winner
