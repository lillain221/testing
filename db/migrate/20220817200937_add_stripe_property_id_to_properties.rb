class AddStripePropertyIdToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :stripe_property_id, :string
  end
end
