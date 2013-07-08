class AddSongIdToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :song_id, :integer
  end
end
