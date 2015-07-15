class AddAnotherFieldToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :contactMenu_pl, :string
    add_column :translations, :contactMenu_en, :string
    add_column :translations, :contactMenu_it, :string
    add_column :translations, :newsHeader_pl, :string
    add_column :translations, :newsHeader_en, :string
    add_column :translations, :newsHeader_it, :string
  end
end
