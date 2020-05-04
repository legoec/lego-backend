json.extract! vendor_request, :id, :status, :feedback
json.vendor vendor_request.vendor, partial: 'vendor', as: :vendor
