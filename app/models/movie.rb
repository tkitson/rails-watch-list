class Movie < ApplicationRecord
  # has_many :lists, through: :bookmarks
  has_many :bookmarks
  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true
end
