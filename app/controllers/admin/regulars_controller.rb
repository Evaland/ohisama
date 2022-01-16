class Admin::RegularsController < Admin::Base
    before_action :admin_login_required
end
