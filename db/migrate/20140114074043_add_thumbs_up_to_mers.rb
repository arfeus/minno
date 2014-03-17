class AddThumbsUpToMers < ActiveRecord::Migration
  def change
    add_column :mers, :thumbsUp, :integer
  end
end
