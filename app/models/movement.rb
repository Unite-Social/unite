class Movement < ApplicationRecord
  belongs_to :user
  validates :name, :date, :rewards, :description, :addrerss, :contact, presence: true
end
