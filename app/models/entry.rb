class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :board

  after_validation :set_scored_at

  def set_scored_at
    self.scored_at = DateTime.now
  end

  scope :paginate, -> (per_page, page_num) { order("score DESC").order("created_at ASC").limit(per_page).offset(page_num)}
  scope :sorted_score, -> {order("score DESC").order("scored_at ASC")} 
end
