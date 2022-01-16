class Admin::OrdersController < Admin::Base
    before_action :admin_login_required
    
    def index
        @orders = Member.order("number")
    end

end