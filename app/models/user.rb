class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



validates :nickname, presence: true
validates :first_name,format: { /\A[ぁ-んァ-ン一-龥]/ }
validates :family_name,format: { /\A[ぁ-んァ-ン一-龥]/ }
validates :first_kana, format: { /\A[ァ-ヶー－]+\z/ }
validates :family_kana, format: { /\A[ァ-ヶー－]+\z/ }
validates :email, presence: true
validates :email, presence: true, uniqueness: true
validates :email, inclusion: { in: ["@"] }
validates :password, presence: true
validates :password, length: { minimum: 6 }
validates :password, format: { with: /\A[a-zA-Z]+\z/ }
validates :password, confirmation: true
end
