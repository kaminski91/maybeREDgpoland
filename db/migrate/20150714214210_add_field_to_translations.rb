class AddFieldToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :portfolioMenu_pl, :string
    add_column :translations, :portfolioMenu_en, :string
    add_column :translations, :portfolioMenu_it, :string
  end
end
