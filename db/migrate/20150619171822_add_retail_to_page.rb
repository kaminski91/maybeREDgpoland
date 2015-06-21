class AddRetailToPage < ActiveRecord::Migration
  def change
    add_column :pages, :retailAcademyText, :text
    add_column :pages, :carieerText, :text
    add_column :pages, :contactText, :text
  end
end
