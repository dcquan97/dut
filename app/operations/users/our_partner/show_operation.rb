class Users::OurPartner::ShowOperation < Users::OurPartner::BaseOperation
  attr_reader :our_partner

  private

  def build_form
    @our_partner = OurPartner.find(params[:id])
  end
end
