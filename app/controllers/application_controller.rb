class ApplicationController < ActionController::Base
    private def login_required
        raise LoginRequired unless current_member
    end
  
    private def rescue_bad_request(exception)
        render "errors/bad_request", status: 400, layout: "error",
        formats: [:html]
    end
      
    private def rescue_login_required(exception)
        render "errors/login_required", status: 403, layout: "error",
        formats: [:html]
    end
      
    private def rescue_forbidden(exception)
        render "errors/forbidden", status: 403, layout: "error",
        formats: [:html]
    end
      
    private def rescue_not_found(exception)
        render "errors/not_found", status: 404, layout: "error",
        formats: [:html]
    end
      
    private def rescue_internal_server_error(exception)
        render "errors/internal_server_error", status: 500, layout: "error",
        formats: [:html]
    end
  
    private def update_expiration_time
        if cookies.signed[:member_id]
            cookies.signed[:member_id] = {value: current_member.id, expires:10.minutes.from_now}
        end
    end
end
