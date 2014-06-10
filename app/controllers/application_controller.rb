class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Apartment::SchemaNotFound, with: :not_found

  protected

    def not_found(exception)
      logger.info "******** asdkfjaskfjsaljfklaskjflsajkflsafkj"
      raise ActionController::RoutingError.new('Page Not Found')
    end
end
