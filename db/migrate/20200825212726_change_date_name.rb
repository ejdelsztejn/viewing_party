class ChangeDateName < ActiveRecord::Migration[5.2]
  def change
    rename_column :parties, :date, :start_time
  end
end
