class GraphqlController < ApplicationController
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, only: [:execute]
  def execute
    result = ZammadWidgetAppSchema.execute(
      params[:query],
      variables: params[:variables],
      context: {},
      operation_name: params[:operationName]
    )
    render json: result
  rescue => e
    render json: { errors: [{ message: e.message }] }, status: 500
  end

  private

  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      ambiguous_param.present? ? JSON.parse(ambiguous_param) : {}
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")
    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
