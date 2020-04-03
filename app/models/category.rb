class Category < ApplicationRecord
  begin :relationships
    has_many :providers
  end
end
