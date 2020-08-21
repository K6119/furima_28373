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
  validates :first_name, format: /\A[ぁ-んァ-ン一-龥]/
  validates :family_name, format: /\A[ぁ-んァ-ン一-龥]/
  validates :first_kana, format:  /\A[ァ-ヶー－]+\z/
  validates :family_kana, format: /\A[ァ-ヶー－]+\z/
  validates :password, format: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i
end
