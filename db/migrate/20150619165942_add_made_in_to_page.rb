class AddMadeInToPage < ActiveRecord::Migration
  def change
    add_column :pages, :madeInGText, :text
  end
end
