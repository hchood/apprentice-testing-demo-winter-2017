class Album < ApplicationRecord
  belongs_to :artist

  validates :artist, presence: true
  validates :title, presence: true, uniqueness: { scope: :artist_id }
end
