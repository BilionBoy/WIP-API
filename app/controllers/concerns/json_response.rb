module JsonResponse
  extend ActiveSupport::Concern

  def render_success(data: nil, message:, status: :ok)
    render json: {
      status:  "successo",
      message: message,
      data:    data
    }, status: status
  end

  def render_error(message:, errors: nil, status: :unprocessable_entity)
    render json: {
      status:  "error",
      message: message,
      errors:  errors
    }, status: status
  end
end
