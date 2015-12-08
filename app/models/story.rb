class Story < ActiveRecord::Base
  enum state: [:unstarted, :started, :finished, :delivered, :rejected, :accepted]

  ACCEPTED_CHANGES = {
    "unstarted" => [:started],
    "started" => [:finished],
    "finished" => [:delivered],
    "delivered" => [:rejected, :accepted],
    "rejected" => [:started],
    "accepted" => []
  }
  def can_change_state_to? next_state
    ACCEPTED_CHANGES[state].include? next_state
  end
end
