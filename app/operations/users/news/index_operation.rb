class Users::News::IndexOperation < Users::News::BaseOperation
  attr_reader :news, :query, :paginate

  def call
    load_news
  end

  private

  def load_news
    @query = New.ransack(params[:query])
    @paginate, @news = pagy(query.result, items: per_page)
  end
end
