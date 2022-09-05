# frozen_string_literal: true

class Property < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true


  monetize :price_cents, allow_nil: true
  has_many_attached :images, dependent: :destroy

  has_many :reviews, as: :reviewable
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  has_many :cart_items
  has_many :carts, through: :cart_items


  def default_image
    images.first
  end

  def favorited_by?(user)
    return if user.nil?

    favorited_users.include?(user)
  end



end
