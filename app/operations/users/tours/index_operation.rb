class Users::Tours::IndexOperation < Users::Tours::BaseOperation
  attr_reader :tours, :query, :paginate

  def call
    load_tours
  end

  private

  def load_tours
    @query = Tour.ransack(params[:query])
    @paginate, @tours = pagy(query.result, items: per_page)
  end
end
