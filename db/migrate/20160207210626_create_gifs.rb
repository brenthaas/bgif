class CreateGifs < ActiveRecord::Migration[5.0]
  def change
    create_table :gifs do |t|
      t.string :title, null: false
      t.text :url, null: false

      t.timestamps
    end
  end
end
