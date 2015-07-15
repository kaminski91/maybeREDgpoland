class RemoveMadeInGTextFromPages < ActiveRecord::Migration
  def change
    remove_column :pages, :madeInGText, :text
  end
end
