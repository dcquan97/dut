class Users::OurTeam::UpdateOperation < Users::OurTeam::BaseOperation
  attr_reader :our_team

  def call
    load_our_team
    build_form
    validate { return true }
    update_our_team
  end

  private

  def load_our_team
    @our_team = OurTeam.find(params[:id])
  end

  def build_form
    @form = Users::OurTeam::UpdateForm.new(permit_params)
  end

  def update_our_team
    our_team.update! form.attributes.reject { |_, v| v.blank?}
  end

end
