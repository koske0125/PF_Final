class CreateClubBoardComments < ActiveRecord::Migration[6.1]
  def change
    create_table :club_board_comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :club_board, foreign_key: true, null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
