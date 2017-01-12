class AlbumSerializer < ActiveModel::Serializer
  has_one :artist

  attributes :id, :created_at, :updated_at, :title, :year

  embed :ids
end
