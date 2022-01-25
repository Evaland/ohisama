class Admin::RegularsController < Admin::Base
    before_action :admin_login_required

    def index
        @members = Member.where(regular_member: true)
        @regulars = Regular.where(item_id: 1)

    end

    def show
        @regulars = Regular.find_by(id: params[:id])
        @regular = Regular.where(member_id: @regulars.member_id)
    end

    def edit
        @regulars = Regular.find_by(id: params[:id])
        @regular1 = Regular.find_by(member_id: @regulars.member_id, item_id: 1)
        @regular2 = Regular.find_by(member_id: @regulars.member_id, item_id: 2)
    end

    def update
        @regular = Regular.find(params[:id])
        @regular.assign_attributes(params[:regular])
        if @regular.save
          redirect_to :admin_regulars, notice: "マイページを更新しました。"
        else
          render "edit"
        end
    end
end
