class Users::OurGuest::CreateOperation < Users::OurGuest::BaseOperation
  attr_reader :our_guest

  def call
    build_form
    validate { return true }
    create_our_guest
  end

  private

  def build_form
    @form = Users::OurGuest::CreateForm.new(permit_params)
  end

  def create_our_guest
    @our_guest = OurGuest.create!(@form.attributes)
  end
end
