class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :last_name, presence: true
	validates :first_name, presence: true
	validates :last_kana, presence: true, format: {with: /[\p{katakana}　ー－]+/,message: "カタカナのみで入力して下さい"}
	validates :first_kana, presence: true, format: {with: /[\p{katakana}　ー－]+/,message: "カタカナのみで入力して下さい"}
	validates :zip_code, presence: true, length: { is: 7}, format: {with: /\A[0-9０-９]+\z/,message: "数字のみで入力して下さい"}
	validates :address, presence: true
	validates :tel, presence: true, length: { minimum: 10, maximum: 11}, format: {with: /\A[0-9０-９]+\z/,message: "数字のみで入力して下さい"}

  acts_as_paranoid

  has_many :ships, dependent: :destroy
  has_many :sells, dependent: :destroy
end

