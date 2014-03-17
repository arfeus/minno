class ChangeThumbsUpToVoteInMers < ActiveRecord::Migration
  def change
    rename_column :mers, :thumbs_up, :vote
  end
end
