# == Schema Information
#
# Table name: experiences
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  start_date  :datetime
#  end_date    :datetime
#  vendor_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Experience < ApplicationRecord
  belongs_to :vendor
end
