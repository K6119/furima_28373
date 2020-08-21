class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :email
    validates :birthday
  end
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i

  validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :first_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :family_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i }



end
