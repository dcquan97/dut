class Users::News::UpdateOperation < Users::News::BaseOperation
  attr_reader :new

  def call
    load_new
    build_form
    validate { return true }
    update_new
  end

  private

  def load_new
    @new = New.find(params[:id])
  end

  def build_form
    @form = Users::News::UpdateForm.new(permit_params)
  end

  def update_new
    new.update! form.attributes.reject { |_, v| v.blank?}
  end

end
