class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :startMore_pl
      t.string :startMore_en
      t.string :startMore_it
      t.string :aboutHeader_pl
      t.string :aboutHeader_en
      t.string :aboutHeader_it
      t.string :portfolioHeader_pl
      t.string :portfolioHeader_en
      t.string :portfolioHeader_it
      t.string :portfolioMore_pl
      t.string :portfolioMore_en
      t.string :portfolioMore_it
      t.string :carieerHeader_pl
      t.string :carieerHeader_en
      t.string :carieerHeader_it
      t.string :contactHeader_pl
      t.string :contactHeader_en
      t.string :contactHeader_it
      t.string :contactFollow_pl
      t.string :contactFollow_en
      t.string :contactFollow_it
      t.string :formName_pl
      t.string :formName_en
      t.string :formName_it
      t.string :formEmail_pl
      t.string :formEmail_en
      t.string :formEmail_it
      t.string :formTel_pl
      t.string :formTel_en
      t.string :formTel_it
      t.string :formContent_pl
      t.string :formContent_en
      t.string :formContent_it
      t.string :salonHeader_pl
      t.string :salonHeader_en
      t.string :salonHeader_it

      t.timestamps null: false
    end
  end
end
