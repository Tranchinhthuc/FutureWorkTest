class Story < ActiveRecord::Base
  STATES = {closed: :closed, in_progress: :in_progress, open: :open, pending: :pending}
  enum state: STATES.values
end
