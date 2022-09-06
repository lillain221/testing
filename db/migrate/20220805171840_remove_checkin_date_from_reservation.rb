class RemoveCheckinDateFromReservation < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :checkin_date, :date
  end
end
