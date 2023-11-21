class Users::OurPartner::CreateOperation < Users::OurPartner::BaseOperation
  attr_reader :our_partner

  def call
    build_form
    validate { return true }
    create_our_partner
  end

  private

  def build_form
    @form = Users::OurPartner::CreateForm.new(permit_params)
  end

  def create_our_partner
    @our_partner = OurPartner.create!(@form.attributes)
  end
end
