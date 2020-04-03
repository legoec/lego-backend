class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.references :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
