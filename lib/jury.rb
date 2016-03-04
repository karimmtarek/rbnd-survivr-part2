class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(name)
    members << name
  end

  def cast_votes(finalists)
    votes = {}

    finalists.each do |finalist|
      votes[finalist] = 0
    end

    count_votes(finalists, votes)
  end

  def report_votes(final_votes = cast_votes(finalists))
    final_votes.each do |k, v|
      puts "#{k} received #{v} vote"
    end
  end

  def announce_winner(final_votes = cast_votes(finalists))
    max_votes = final_votes.values.max
    winner = final_votes
               .select { |_k, v| v == max_votes }
               .keys
               .first

    puts "The winner of this game of Survivor is: #{winner.name.green}"
    winner
  end

  private

  def count_votes(finalists, votes)
    members.each do |member|
      vote = finalists.sample
      votes[vote] += 1
      puts "#{member} voted for #{vote}"
    end

    votes
  end
end
