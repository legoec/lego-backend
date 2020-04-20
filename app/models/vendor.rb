# == Schema Information
#
# Table name: vendors
#
#  id                   :bigint           not null, primary key
#  ruc                  :string
#  economic_activity    :string
#  contributor_type     :string
#  legal_representative :string
#  business_name        :string
#  image                :string
#  logo                 :string
#  slogan               :string
#  mobile               :string
#  active               :boolean          default(FALSE)
#  user_id              :bigint           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  category_id          :bigint
#
class Vendor < ApplicationRecord
  begin :relationships
    belongs_to :user
    belongs_to :category
    has_many :experiences
    has_many :recomendations
    has_many :vendor_requests
  end
end
