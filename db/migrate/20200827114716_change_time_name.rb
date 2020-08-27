class ChangeTimeName < ActiveRecord::Migration[5.2]
  def change
    rename_column :parties, :time, :end_time
  end
end
