class AddOrderToPortfolios < ActiveRecord::Migration
  def change
    add_column :portfolios, :order, :integer
    add_index :portfolios, :order
  end
end
