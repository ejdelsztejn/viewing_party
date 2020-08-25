class CreateViewingParties < ActiveRecord::Migration[5.2]
  def change
    create_table :viewing_parties do |t|
      t.string :movie_title
      t.integer :duration_of_party
      t.datetime :date
      t.datetime :time
      t.integer :friend_ids, array: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
