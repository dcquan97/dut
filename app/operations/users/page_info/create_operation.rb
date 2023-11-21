class Users::PageInfo::CreateOperation < Users::PageInfo::BaseOperation
  attr_reader :page_info

  def call
    build_form
    validate { return true }
    create_page_info
  end

  private

  def build_form
    @form = Users::PageInfo::CreateForm.new(permit_params)
  end

  def create_page_info
    @page_info = PageInfo.create!(@form.attributes)
  end
end
