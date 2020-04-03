# == Schema Information
#
# Table name: experiences
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  start_date  :datetime
#  end_date    :datetime
#  provider_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Experience < ApplicationRecord
  belongs_to :provider
end
