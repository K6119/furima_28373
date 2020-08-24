class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :purchases
  has_many :items

  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i.freeze

  with_options presence: true do
    validates :nickname
    validates :email
    validates :birthday
    validates :first_name, format: { with: VALID_NAME_REGEX }
    validates :family_name, format: { with: VALID_NAME_REGEX }
    validates :first_kana, format: { with: VALID_NAME_KANA_REGEX }
    validates :family_kana, format: { with: VALID_NAME_KANA_REGEX }
    validates :password, format: { with: VALID_PASSWORD_REGEX }
  end
end
