class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :payment
  belongs_to :area
  belongs_to :days

  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :title, :image, :text, presence: true
  validates :price, presence:true, inclusion: {in: (300..9999999), message: "を¥300〜9,999,999の間で入力してください"}, format: {with: /\A[0-9]+\z/, message: "を半角数字で入力してください"}

  with_options numericality: { other_than: 1, message: "を選択してください" }do
    validates :category_id
    validates :status_id
    validates :payment_id
    validates :area_id
    validates :days_id
  end

end
