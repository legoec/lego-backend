class VendorRequestValidation < ActiveRecord::Migration[6.0]
  def change
    change_column_null :vendor_requests, :status, false
  end
end
