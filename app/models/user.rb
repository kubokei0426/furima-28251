class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :exhibitions
  has_many :purchasers
  with_options presence: true do
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}+\z/.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :nickname
  validates :password, format: { with:VALID_PASSWORD_REGEX}
  validates :password_confirmation
  validates :email
  validates :password, length: { minimum: 6 },
                                format: { with:
                                VALID_PASSWORD_REGEX}
  validates :first_name, format: { with:
                                  VALID_NAME_REGEX}
  validates :last_name, format: { with:
                                  VALID_NAME_REGEX}
  validates :first_name_kana, format: { with:
                                      VALID_NAME_KANA_REGEX}
  validates :last_name_kana, format: { with:
                                      VALID_NAME_KANA_REGEX}
  validates :birth_date
  end
end
