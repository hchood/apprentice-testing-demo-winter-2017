class ArtistSerializer < ActiveModel::Serializer
  has_many :albums

  attributes :id, :created_at, :updated_at, :name

  embed :ids
end
