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
require 'rails_helper'

RSpec.describe Vendor, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
