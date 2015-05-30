module Fuel
  class FuelController < ::FuelController
    http_basic_authenticate_with name: Fuel.configuration.username, password: Fuel.configuration.password
  end
end