class CreateMers < ActiveRecord::Migration
  def change
    create_table :mers do |t|
      t.string :title
      t.string :text

    end
  end
end
