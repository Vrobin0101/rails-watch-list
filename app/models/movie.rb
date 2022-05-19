class Movie < ApplicationRecord
  has_many :bookmarks
  validates_uniqueness_of :title, :overview
  validates_presence_of :title, :overview
end
