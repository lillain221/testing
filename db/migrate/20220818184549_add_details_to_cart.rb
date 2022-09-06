class AddDetailsToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :name, :string
    add_column :carts, :post_code, :integer
    add_column :carts, :prefecture, :string
    add_column :carts, :municipality, :string
    add_column :carts, :house_number, :string
    add_column :carts, :phone_number, :integer
  end
end
