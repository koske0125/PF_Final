class ChangeFriendColumnDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :friends, :twitter, nil
  end
end
