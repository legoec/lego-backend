# == Schema Information
#
# Table name: agreements
#
#  id         :bigint           not null, primary key
#  name       :string
#  duration   :integer
#  cost       :float
#  rating     :integer
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  service_id :bigint           not null
#
require 'rails_helper'

RSpec.describe Agreement, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
end
