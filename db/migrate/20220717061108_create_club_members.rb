class CreateClubMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :club_members do |t|
      t.references :club, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
