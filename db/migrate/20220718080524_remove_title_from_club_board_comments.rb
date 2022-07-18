class RemoveTitleFromClubBoardComments < ActiveRecord::Migration[6.1]
  def change
     remove_column :club_board_comments, :title
  end
end
