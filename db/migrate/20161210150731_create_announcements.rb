class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :image_data
      t.text :content
      t.datetime :date

      t.timestamps
    end
  end
end
