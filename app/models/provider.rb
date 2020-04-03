class Provider < ApplicationRecord
  begin :relationships
    belongs_to :user
    belongs_to :category
  end
end
