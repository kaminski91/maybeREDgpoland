class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :salons, :coutry, :country
  end
end
