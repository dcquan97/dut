class ApplicationOperation
  include Pagy::Backend
  attr_accessor :current_actor, :params, :errors, :error_message

  def initialize(params, current_actor = nil)
    @current_actor  = current_actor
    @params = params
  end

  def call; end

  def per_page
    params[:limit].presence || 20
  end

  def error?
    @errors.present? || @error_message.present?
  end

  private

  def validate
    return if @form.valid?
    @errors = @form.error_message
    yield
  end
end
