class ArtistSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :name
end
