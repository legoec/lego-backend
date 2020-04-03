class CreateRecomendations < ActiveRecord::Migration[6.0]
  def change
    create_table :recomendations do |t|
      t.string :name
      t.text :description
      t.string :contact
      t.references :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
