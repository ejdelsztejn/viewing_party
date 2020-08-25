class RenameViewPartiesToParties < ActiveRecord::Migration[5.2]
  def change
    rename_table :view_parties, :parties
  end
end
