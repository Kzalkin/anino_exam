class LeaderboardSerializer < ActiveModel::Serializer
  type 'board'
  
  attributes :id, :name
end
