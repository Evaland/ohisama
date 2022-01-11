class OrdersController < ApplicationController
    def index
        @orders = Member.order("number")
    end
end
