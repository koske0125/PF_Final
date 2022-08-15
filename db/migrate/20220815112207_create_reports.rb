class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.integer :genre, null: false
      t.integer :address, null: false
      t.integer :status, null: false
      t.timestamps
    end
  end
end
