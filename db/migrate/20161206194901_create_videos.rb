class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :youtube_video_id
      t.string :status
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
