class Users::OurTeam::ShowOperation < Users::OurTeam::BaseOperation
  attr_reader :our_team

  private

  def build_form
    @our_team = OurTeam.find(params[:id])
  end
end
