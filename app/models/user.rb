class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :records

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  ZENKAKU = /\A[ぁ-んァ-ン一-龥々ー]+\z/
  ZENKAKU_KANA = /\A[ァ-ヶー－]+\z/
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }
  validates :nickname,        presence: true
  validates :first_name,      presence: true, format: { with: ZENKAKU, message: 'は全角文字を使用してください' }
  validates :last_name,       presence: true, format: { with: ZENKAKU, message: 'は全角文字を使用してください' }
  validates :first_name_kana, presence: true, format: { with: ZENKAKU_KANA, message: 'は全角カナ文字を使用してください' }
  validates :last_name_kana,  presence: true, format: { with: ZENKAKU_KANA, message: 'は全角カナ文字を使用してください' }
  validates :birthday,        presence: true
end
