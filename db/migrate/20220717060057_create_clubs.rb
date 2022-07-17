class CreateClubs < ActiveRecord::Migration[6.1]
  def change
    create_table :clubs do |t|
      t.references :user, foreign_key: true, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
