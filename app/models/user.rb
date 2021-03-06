class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :password_confirmation, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください' }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'には全角文字を使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角カナ文字を使用してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角カナを使用してください' }
    validates :birth_day
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'には英字と数字の両方を含めて設定してください' }
end
