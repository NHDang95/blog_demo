class CreateMicroposts < ActiveRecord::Migration[5.1]
  def change
    create_table :microposts do |t|
      t.string :title
      t.text :content
      t.string :image_url

      t.timestamps
    end
  end
end
