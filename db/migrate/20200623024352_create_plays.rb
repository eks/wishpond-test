class CreatePlays < ActiveRecord::Migration[6.0]
  def change
    create_table :plays do |t|
      t.string :time
      t.string :image_url
      t.references :game, null: false, foreign_key: true

      t.timestamps
    end
  end
end
