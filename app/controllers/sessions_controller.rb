class SessionsController < ApplicationController
    def create
      member = Member.find_by(user_id: params[:user_id])
      if member&.authenticate(params[:password])
        session[:member_id] = member.id
      else
        flash.alert = "名前とパスワードが一致しません"
      end
      if current_member&.admin_member?
        redirect_to :admin_root
      else
        redirect_to :root
      end
    end
  
    def destroy
      session.delete(:member_id)
      redirect_to :root
    end
  end
