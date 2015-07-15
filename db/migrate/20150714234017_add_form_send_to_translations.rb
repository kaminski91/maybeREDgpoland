class AddFormSendToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :formSend_pl, :string
    add_column :translations, :formSend_en, :string
    add_column :translations, :formSend_it, :string
  end
end
