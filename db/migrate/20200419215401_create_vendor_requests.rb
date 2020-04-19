class CreateVendorRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :vendor_requests do |t|
      t.string :status
      t.text :feedback
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
