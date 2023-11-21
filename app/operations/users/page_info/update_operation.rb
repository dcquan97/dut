class Users::PageInfo::UpdateOperation < Users::PageInfo::BaseOperation
  attr_reader :page_info

  def call
    load_page_info
    build_form
    validate { return true }
    update_page_info
  end

  private

  def load_page_info
    @page_info = PageInfo.find(params[:id])
  end

  def build_form
    @form = Users::PageInfo::UpdateForm.new(permit_params)
  end

  def update_page_info
    page_info.update! form.attributes.reject { |_, v| v.blank?}
  end

end
