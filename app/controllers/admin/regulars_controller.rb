class Admin::RegularsController < Admin::Base
    before_action :admin_login_required

    def index
        @members = Member.where(regular_member: true)
    end
end
