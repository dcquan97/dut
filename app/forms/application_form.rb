class ApplicationForm
  include ActiveModel::Model
  include ActiveModel::Attributes
  include ActiveModel::Validations
  include ActiveModel::Validations::Callbacks

  before_validation :auto_strip_attributes

  def auto_strip_attributes
    self.attributes.each do |attribute, value|
      self.attributes[attribute] = value.squish! if value.is_a?(String)
    end
  end

  def valid!
    return if valid?
    raise BadRequestError.new(fetch_messages)
  end

  def error_message
    return first_error_message unless valid?
  end

  def attributes
    super.symbolize_keys
  end

  private

  def first_error_message
    return @messages if @messages.present?
    # get only the first error message of each attributes
    @messages = errors.messages.inject({}) do |messages, message|
      messages.merge message.first => message.second.first
    end
  end
end
