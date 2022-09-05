class RemoveUserIdFromProperty < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :user_id, :bigint
  end
end
