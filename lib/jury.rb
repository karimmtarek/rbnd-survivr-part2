class Jury
  attr_accessor :members, :total_votes

  def initialize
    @members = []
    @total_votes = 0
  end

  def add_member(name)
    members << name
  end

  def cast_votes(finalists)
    h = {}

    finalists.each do |finalist|
      h[finalist] = 0
    end

    members.each do |member|
      vote = finalists.sample
      h[vote] += 1
      puts "#{member} voted for #{vote.to_s}"
    end

    h
  end

  def total_votes
    cast_votes(finalists).each { |_k, v| total_votes += v }
  end

  def report_votes(final_votes = cast_votes(finalists))
    final_votes.each do |k, v|
      puts "#{k.to_s} has #{v} vote(s)."
    end
  end

  def announce_winner(final_votes = cast_votes(finalists))
    max_votes = final_votes.values.max
    final_votes
      .select { |_k, v| v == max_votes }
      .keys
      .first
  end
end
