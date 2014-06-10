class SubdomainElevator < Apartment::Elevators::Subdomain
  def call(env)
    request = Rack::Request.new(env)

    database = @processor.call(request)

    begin
      Apartment::Database.switch database if database
    rescue Apartment::DatabaseNotFound, Apartment::SchemaNotFound
      raise ActionController::RoutingError.new('Page Not Found')
    end

    @app.call(env)
  end
end