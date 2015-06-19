class AddContentToPortfolio < ActiveRecord::Migration
  def change
    add_column :portfolios, :title, :string
    add_column :portfolios, :content, :text
  end
end
