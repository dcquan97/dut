class Users::OurPartner::UpdateOperation < Users::OurPartner::BaseOperation
  attr_reader :our_partner

  def call
    load_our_partner
    build_form
    validate { return true }
    update_our_partner
  end

  private

  def load_our_partner
    @our_partner = OurPartner.find(params[:id])
  end

  def build_form
    @form = Users::OurPartner::UpdateForm.new(permit_params)
  end

  def update_our_partner
    our_partner.update! form.attributes.reject { |_, v| v.blank?}
  end

end
