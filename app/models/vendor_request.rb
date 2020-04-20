# == Schema Information
#
# Table name: vendor_requests
#
#  id         :bigint           not null, primary key
#  status     :string           not null
#  feedback   :text
#  vendor_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class VendorRequest < ApplicationRecord
  STATUS = [
    "pending",
    "approved",
    "disabled",
    "declined"
  ].freeze

  begin :relationships
    belongs_to :vendor
  end

  begin :validations
    validates :vendor_id, :status, presence: true
    validates :status,
              inclusion: { in: STATUS }
  end
end
