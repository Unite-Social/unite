class Movement < ApplicationRecord
  belongs_to :user
  validates :name, :date, :rewards, :description, :address, :contact, presence: true
end
