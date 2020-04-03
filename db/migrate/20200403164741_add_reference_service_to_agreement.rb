class AddReferenceServiceToAgreement < ActiveRecord::Migration[6.0]
  def change
    add_reference :agreements, :service, null: false, foreign_key: true
  end
end
