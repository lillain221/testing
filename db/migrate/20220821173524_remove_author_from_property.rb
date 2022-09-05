class RemoveAuthorFromProperty < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :headline, :string
    remove_column :properties, :city, :string
    remove_column :properties, :state, :string
    remove_column :properties, :address_1, :string
    remove_column :properties, :address_2, :string
    remove_column :properties, :latitude, :float
    remove_column :properties, :longitude, :float
    remove_column :properties, :zip_code, :string
    remove_column :properties, :price_currency, :string
    remove_column :properties, :country_code, :string
  end
end
