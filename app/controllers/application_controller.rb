class ApplicationController < ActionController::API

  def render_json(message, success = true, status = :ok)
    render json: { data: message, success: success }, status: status
  end
end
