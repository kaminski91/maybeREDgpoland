class AddMapButtonToTranslation < ActiveRecord::Migration
  def change
    add_column :translations, :map_pl, :string
    add_column :translations, :map_en, :string
    add_column :translations, :map_it, :string
  end
end
