class AddDetailsToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :post_code, :string
    add_column :users, :prefecture, :string
    add_column :users, :municipality, :string
    add_column :users, :house_number, :string
    add_column :users, :phone_number, :string
  end
end
