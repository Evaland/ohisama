class Admin::CategoriesController < Admin::Base
    before_action :admin_login_required

    def index
        @categories = Category.order("id")
    end
    
    def show 
        @category = Category.find(params[:id])
        @item = Item.find(params[:id])
        @items = Item.where(author_category:params[:id])
    end
    
    def search
        @items = Item.search(params[:q])
        render "show"
    end
end
