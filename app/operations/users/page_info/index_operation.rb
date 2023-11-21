class Users::PageInfo::IndexOperation < Users::PageInfo::BaseOperation
  attr_reader :page_info, :query, :paginate

  def call
    load_page_info
  end

  private

  def load_page_info
    @query = PageInfo.ransack(params[:query])
    @paginate, @page_info = pagy(query.result, items: per_page)
  end
end
