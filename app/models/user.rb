class User < ApplicationRecord
  has_many :items
  has_many :purchases
  has_many :comments

  validates :nickname, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'is invalid. Input full-width characters' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width katakana characters' } do
    validates :first_name_kana
    validates :last_name_kana
  end
  validates :birthday, presence: true
end
