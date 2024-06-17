class User < ApplicationRecord
  has_one_attached :photo
  has_many :movements
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  validates :name, :phone, presence: true
  validates :cnpj, :organization_type, :description, presence: true, if: :organization?

  ORGANIZATION_TYPES = [
    "Ong", "Private Company",
    "Public Agency",
    "Community Association",
    "Student Association",
    "Religious Organization"
  ]
  def organization?
    organization == true
  end

  validates :organization_type, inclusion: { in: [ORGANIZATION_TYPES, nil].flatten }
end
