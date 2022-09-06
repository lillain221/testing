class ChangeDataPhoneNumberToCart < ActiveRecord::Migration[7.0]
  def change
    change_column :carts, :phone_number, :string
  end
end
