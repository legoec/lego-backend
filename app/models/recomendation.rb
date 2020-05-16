# == Schema Information
#
# Table name: recomendations
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  contact     :string           not null
#  vendor_id   :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Recomendation < ApplicationRecord
  begin :relationships
  end

  begin :validations
  end
end
