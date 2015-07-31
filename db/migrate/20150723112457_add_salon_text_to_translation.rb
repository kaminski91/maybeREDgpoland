class AddSalonTextToTranslation < ActiveRecord::Migration
  def change
    add_column :translations, :salonText_pl, :string
    add_column :translations, :salonText_en, :string
    add_column :translations, :salonText_it, :string
  end
end
