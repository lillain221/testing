class ChangeDataPhoneNumberToCarts < ActiveRecord::Migration[7.0]
  def change
    change_column :carts, :phone_number, :bigint
  end
end
