class AddUserIdToMers < ActiveRecord::Migration
  def change
    add_column :mers, :user_id, :integer
  end
end
