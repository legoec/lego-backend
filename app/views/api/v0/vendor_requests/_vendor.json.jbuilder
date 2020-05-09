json.extract! vendor, :id, :business_name, :slogan, :legal_representative, :economic_activity
json.image vendor.image_url || ''
json.logo vendor.logo_url || ''
