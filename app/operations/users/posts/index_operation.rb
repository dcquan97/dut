class Users::Posts::IndexOperation < Users::Posts::BaseOperation
  attr_reader :posts, :query, :paginate

  def call
    load_posts
  end

  private

  def load_posts
    @query = Tour.ransack(params[:query])
    @paginate, @posts = pagy(query.result, items: per_page)
  end
end
