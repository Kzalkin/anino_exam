class BoardSerializer < ActiveModel::Serializer
  type 'board'

  attributes :id, :name

  has_many :entries

  def entries
    self.object.entries.order("score DESC")
  end
end
