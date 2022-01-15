class Regular < ApplicationRecord
    has_many :items, dependent: :destroy
    belongs_to :author_member, class_name: "Member", foreign_key: "member_id"
end
