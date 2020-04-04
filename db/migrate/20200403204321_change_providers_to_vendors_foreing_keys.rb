class ChangeProvidersToVendorsForeingKeys < ActiveRecord::Migration[6.0]
  def change
    rename_column :services, :provider_id, :vendor_id
    rename_column :experiences, :provider_id, :vendor_id
    rename_column :recomendations, :provider_id, :vendor_id
  end
end
