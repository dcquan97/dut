class Users::OurTeam::IndexOperation < Users::OurTeam::BaseOperation
  attr_reader :our_team, :query, :paginate

  def call
    load_our_team
  end

  private

  def load_our_team
    @query = OurTeam.ransack(params[:query])
    @paginate, @our_team = pagy(query.result, items: per_page)
  end
end
