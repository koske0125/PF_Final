class CreateBoardComments < ActiveRecord::Migration[6.1]
  def change
    create_table :board_comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :board, foreign_key: true, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
