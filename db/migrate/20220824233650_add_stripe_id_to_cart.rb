class AddStripeIdToCart < ActiveRecord::Migration[7.0]
  def change
    add_column :carts, :stripe_id, :string
  end
end
