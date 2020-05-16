class DropOldModels < ActiveRecord::Migration[6.0]
  def change
    remove_reference :agreements, :service, index: true, foreign_key: true
    remove_reference :experiences, :vendor, index: true, foreign_key: true
    drop_table :agreements
    drop_table :experiences
  end
end
