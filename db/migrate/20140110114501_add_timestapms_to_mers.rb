class AddTimestapmsToMers < ActiveRecord::Migration
  def change
    change_table :mers do |t|
      t.timestamps
    end
  end
end
