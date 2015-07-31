class RenameColumnInPortfolios < ActiveRecord::Migration
  def change
  	rename_column :portfolios, :order, :np
  end
end
