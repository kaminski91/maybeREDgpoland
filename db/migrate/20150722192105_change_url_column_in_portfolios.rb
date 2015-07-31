class ChangeUrlColumnInPortfolios < ActiveRecord::Migration
  def change
  	rename_column :portfolios, :url, :www
  end
end
