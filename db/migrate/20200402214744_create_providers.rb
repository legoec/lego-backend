class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :ruc
      t.string :economic_activity
      t.string :contributor_type
      t.string :legal_representative
      t.string :business_name
      t.string :image
      t.string :logo
      t.string :slogan
      t.string :mobile
      t.boolean :active, default: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
