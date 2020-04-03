# == Schema Information
#
# Table name: recomendations
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  contact     :string
#  provider_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Recomendation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
