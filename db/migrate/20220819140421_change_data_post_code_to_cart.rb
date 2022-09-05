class ChangeDataPostCodeToCart < ActiveRecord::Migration[7.0]
  def change
    change_column :carts, :post_code, :string
  end
end
