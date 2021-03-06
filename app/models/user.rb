class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth
    validates :password, format: {with: (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i), message: "は半角英数で入力してください"}

    with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "は全角で入力してください"} do
      validates :family_name
      validates :first_name
    end

    with_options format: {with: /\A[ァ-ヶ]+\z/, message: "は全角カナで入力してください"} do
      validates :family_name_ruby 
      validates :first_name_ruby
    end
  end

  has_many :items
  has_many :orders

end