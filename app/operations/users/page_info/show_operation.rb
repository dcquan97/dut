class Users::PageInfo::ShowOperation < Users::PageInfo::BaseOperation
  attr_reader :page_info

  private

  def build_form
    @page_info = PageInfo.find(params[:id])
  end
end
