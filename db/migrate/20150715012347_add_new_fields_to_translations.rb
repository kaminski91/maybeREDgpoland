class AddNewFieldsToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :formPass_pl, :string
    add_column :translations, :formPass_en, :string
    add_column :translations, :formPass_it, :string
    add_column :translations, :formLogin_pl, :string
    add_column :translations, :formLogin_en, :string
    add_column :translations, :formLogin_it, :string
    add_column :translations, :downloadHeader_pl, :string
    add_column :translations, :downloadHeader_en, :string
    add_column :translations, :downloadHeader_it, :string
  end
end
