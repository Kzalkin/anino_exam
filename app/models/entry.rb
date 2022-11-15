class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :board

  after_validation :set_scored_at

  def set_scored_at
    self.scored_at = DateTime.now
  end
end
