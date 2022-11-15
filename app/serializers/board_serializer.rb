class BoardSerializer < ActiveModel::Serializer
  type 'board'

  attributes :id, :name
end
