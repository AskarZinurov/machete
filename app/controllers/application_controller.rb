class ApplicationController < ActionController::API
  def link
    @link ||= Link.find_by!(signature: params[:short_url])
  end

  rescue_from ActiveRecord::RecordNotFound do |_exception|
    head :not_found
  end
end
