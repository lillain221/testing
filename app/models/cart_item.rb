class CartItem < ApplicationRecord
  belongs_to :property
  belongs_to :cart

  def total
    property.price * quantity
  end

  def to_builder
    Jbuilder.new do |cart_item|

      cart_item.price property.stripe_property_id
      cart_item.quantity quantity

    end
  end
end