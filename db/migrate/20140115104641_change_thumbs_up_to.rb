class ChangeThumbsUpTo < ActiveRecord::Migration
  def change
    rename_column :mers, :thumbsUp, :thumbs_up
  end
end
