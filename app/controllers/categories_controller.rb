class CategoriesController < ApplicationController
    def index
        @categories = Category.order("id")
    end
    
    def show

    end
end
