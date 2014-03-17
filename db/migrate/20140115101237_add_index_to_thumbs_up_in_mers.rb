class AddIndexToThumbsUpInMers < ActiveRecord::Migration
  def change
    add_index :mers, :thumbsUp
  end
end
