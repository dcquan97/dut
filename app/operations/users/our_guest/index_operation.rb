class Users::OurGuest::IndexOperation < Users::OurGuest::BaseOperation
  attr_reader :our_guest, :query, :paginate

  def call
    load_our_guest
  end

  private

  def load_our_guest
    @query = OurGuest.ransack(params[:query])
    @paginate, @our_guest = pagy(query.result, items: per_page)
  end
end
