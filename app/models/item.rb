class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :payment
  belongs_to :area
  belongs_to :days

  belongs_to :user
  has_one_attached :image

  validates :title, :text, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :payment_id
    validates :area_id
    validates :days_id
  end

end

#バリテーションまだ
#| price       | integer    | null:false                     |
#| user        | references | null :false, foreign_key: true |
#バリテーション謎
#image 一応has_one_attachedはやったけどお果たしてこれでいいのか謎のため