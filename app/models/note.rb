class Note < ApplicationRecord
  validates :name, uniqueness: true
end
