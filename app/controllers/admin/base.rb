class Admin::Base < ApplicationController
  
    private def admin_login_required
      raise Forbidden unless current_member&.admin_member?
    end
    helper_method :admin_login_required
  end