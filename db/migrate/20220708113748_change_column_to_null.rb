class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column_null :friends, :twitter, true
  end

  def down
    change_column_null :friends, :twitter, false
  end
end
