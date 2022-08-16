module Api
  class ApiController < Api::ApplicationController
    def health
      status = { "status": 'OK' }
      render json: status
    end
  end
end
