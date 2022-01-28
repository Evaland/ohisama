class Status < ApplicationRecord
    belongs_to :member
    belongs_to :order
end
