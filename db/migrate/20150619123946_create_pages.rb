class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :startText
      t.text :aboutText

      t.timestamps null: false
    end
  end
end
