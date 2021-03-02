class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence:true
  validates :family_name, presence:true, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "Full-width characters"}
  validates :first_name, presence:true
  validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "Full-width characters"}
  validates :family_name_ruby, presence:true, format: {with: /\A[ァ-ヶ]+\z/, message: "Full-width katakana characters"}
  validates :first_name_ruby, presence:true, format: {with: /\A[ァ-ヶ]+\z/, message: "Full-width katakana characters"}
  validates :birth, presence:true
  validates :password, format: {with: (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i), message: "Include both letters and numbers"}
end