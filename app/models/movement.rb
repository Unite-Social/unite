class Movement < ApplicationRecord
  has_one_attached :photo
  has_many :participants, dependent: :destroy
  belongs_to :user
  validates :name, :date, :rewards, :description, :address, :contact, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
