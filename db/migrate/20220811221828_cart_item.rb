class CartItem < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :size, :string

  end
end
