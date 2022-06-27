class CreateFriends < ActiveRecord::Migration[6.1]
  def change
    create_table :friends do |t|
      t.references :user, foreign_key: true,  null: false
      t.string :favorite_champion, null: false, default: " "
      t.text :introduction, null: false
      t.integer :rank, null: false, default: 0
      t.boolean :is_rank, null: false, default: false
      t.boolean :is_normal, null: false, default: false
      t.boolean :is_beginner, null: false, default: false
      t.boolean :is_coaching, null: false, default: false
      t.boolean :is_coached, null: false, default: false
      t.boolean :is_clash, null: false, default: false
      t.boolean :good_at_top, null: false, default: false
      t.boolean :good_at_jg, null: false, default: false
      t.boolean :good_at_mid, null: false, default: false
      t.boolean :good_at_adc, null: false, default: false
      t.boolean :good_at_sup, null: false, default: false
      t.boolean :bad_at_top, null: false, default: false
      t.boolean :bad_at_jg, null: false, default: false
      t.boolean :bad_at_mid, null: false, default: false
      t.boolean :bad_at_adc, null: false, default: false
      t.boolean :bad_at_sup, null: false, default: false
      t.string :active_time, null: false, default: " "
      t.string :twitter, null: false, default: " "
      t.integer :vc_status, null: false, default: 0
      t.boolean :vc_discord, null: false, default: false
      t.boolean :vc_skype, null: false, default: false
      t.boolean :vc_leaguevoice, null: false, default: false
      t.timestamps
    end
  end
end
