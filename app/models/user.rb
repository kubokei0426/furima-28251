class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]\z/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :nickname, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true,
                       length: { minimum: 6 },
                       format: {　with: 
                       VALID_PASSWORD_REGEX}
  validates :first_name, presence: true,
                       format: {　with: 
                       VALID_NAME_REGEX}
  validates :last_name, presence: true,
                       format: {　with: 
                       VALID_NAME_REGEX}
  validates :first_name_kana, presence: true,
                       format: {　with: 
                       VALID_NAME_KANA_REGEX}
  validates :last_name_kana, presence: true,
                       format: {　with: 
                       VALID_NAME_KANA_REGEX}
  validates :birth_date, presence: true
end
