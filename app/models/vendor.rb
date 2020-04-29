# == Schema Information
#
# Table name: vendors
#
#  id                   :bigint           not null, primary key
#  ruc                  :string           not null
#  economic_activity    :string
#  contributor_type     :string
#  legal_representative :string           not null
#  business_name        :string           not null
#  image                :string
#  logo                 :string
#  slogan               :string
#  mobile               :string           not null
#  active               :boolean          default(FALSE)
#  user_id              :bigint           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  category_id          :bigint
#
class Vendor < ApplicationRecord
  mount_uploader :image, ApplicationUploader
  mount_uploader :logo, ApplicationUploader

  begin :relationships
    belongs_to :user
    belongs_to :category
    has_many :experiences
    has_many :recomendations
    has_many :vendor_requests
  end

  begin :validations
    validates :ruc, presence: true, uniqueness: true
    validates :business_name, :legal_representative, :category_id, :user_id, :mobile, presence: true
  end
end
