class ChangeTextFormatInMers < ActiveRecord::Migration
  def up
    change_column :mers, :text, :text
  end
  def down
    change_column :mers, :text, :string
  end
end
