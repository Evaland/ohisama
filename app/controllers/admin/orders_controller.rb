class Admin::OrdersController < Admin::Base
    def index
        @orders = Member.order("number")
    end
end