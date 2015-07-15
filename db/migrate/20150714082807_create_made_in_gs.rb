class CreateMadeInGs < ActiveRecord::Migration
  def change
    create_table :made_in_gs do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
