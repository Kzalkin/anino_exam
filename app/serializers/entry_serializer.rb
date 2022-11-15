class EntrySerializer < ActiveModel::Serializer
  type 'entry'

  
  attribute :id, if: :add_score?
  attribute :board_id, if: :add_score?
  
  attributes :score, :user_id, :scored_at

  attribute :rank, if: :ranking?
  attribute :name, if: :ranking?

  def ranking?
    @instance_options[:flag] == "rank"
  end

  def add_score?
    @instance_options[:flag] == "add_score"
  end

  def rank
    Entry.sorted_score.index(self.object)
  end
  
  def name
    self.object.user.name
  end
end
