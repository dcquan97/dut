class Users::Banners::IndexOperation < Users::Banners::BaseOperation
  attr_reader :banners, :query, :paginate

  def call
    load_banners
  end

  private

  def load_banners
    @query = Banner.ransack(params[:query])
    @paginate, @banners = pagy(query.result, items: per_page)
  end
end
