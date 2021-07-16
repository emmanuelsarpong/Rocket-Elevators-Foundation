class Intervention < ApplicationRecord
    before_create do
        self.Status = "Pending"
    end
end
