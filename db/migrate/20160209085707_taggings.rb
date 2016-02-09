class Taggings < ActiveRecord::Migration[5.0]
  def change
    create_table :taggings do |t|
      t.references :tag, null: false, index: true
      t.references :gif, null: false, index: true
      t.timestamps
    end
  end
end
