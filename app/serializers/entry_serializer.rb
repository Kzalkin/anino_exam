class EntrySerializer < ActiveModel::Serializer
  type 'entry'

  attributes :id, :score, :board_id, :score, :scored_at, :user_id
end
