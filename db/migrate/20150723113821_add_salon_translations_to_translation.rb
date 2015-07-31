class AddSalonTranslationsToTranslation < ActiveRecord::Migration
  def change
    add_column :translations, :salonFilter_pl, :string
    add_column :translations, :salonFilter_en, :string
    add_column :translations, :salonFilter_it, :string
    add_column :translations, :salonFilterCountry_pl, :string
    add_column :translations, :salonFilterCountry_en, :string
    add_column :translations, :salonFilterCountry_it, :string
    add_column :translations, :salonFilterCity_pl, :string
    add_column :translations, :salonFilterCity_en, :string
    add_column :translations, :salonFilterCity_it, :string
    add_column :translations, :salonFilterBrand_pl, :string
    add_column :translations, :salonFilterBrand_en, :string
    add_column :translations, :salonFilterBrand_it, :string
    add_column :translations, :salonFilterLocalization_pl, :string
    add_column :translations, :salonFilterLocalization_en, :string
    add_column :translations, :salonFilterLocalization_it, :string
    add_column :translations, :salonFilterAll_pl, :string
    add_column :translations, :salonFilterAll_en, :string
    add_column :translations, :salonFilterAll_it, :string
  end
end
