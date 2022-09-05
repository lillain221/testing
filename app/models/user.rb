class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_properties, through: :favorites, source: :property

  has_many :reviews, dependent: :destroy



end