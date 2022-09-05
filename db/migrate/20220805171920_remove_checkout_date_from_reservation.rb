class RemoveCheckoutDateFromReservation < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :checkout_date, :date
  end
end
