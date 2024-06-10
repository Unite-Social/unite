class User < ApplicationRecord
  has_many :movements
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  validates :name, :phone, presence: true
  validates :cnpj, :organization_type, :description, presence: true, if: :organization?
  def organization?
    organization == true
  end

  validates :organization_type, inclusion: { in: ["Ong", "Private Company", "Public Agency", "Community Association", "Student Association", "Religious Organization", nil] }
end
