# == Schema Information
#
# Table name: providers
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
class Provider < ApplicationRecord
  begin :relationships
    belongs_to :user
    belongs_to :category
    has_many :experiences
  end
end
