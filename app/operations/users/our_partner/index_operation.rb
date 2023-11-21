class Users::OurPartner::IndexOperation < Users::OurPartner::BaseOperation
  attr_reader :our_partner, :query, :paginate

  def call
    load_our_partner
  end

  private

  def load_our_partner
    @query = OurPartner.ransack(params[:query])
    @paginate, @our_partner = pagy(query.result, items: per_page)
  end
end
