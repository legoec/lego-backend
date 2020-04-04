class ChangeProvidersToVendors < ActiveRecord::Migration[6.0]
  def change
    rename_table :providers, :vendors
  end
end
