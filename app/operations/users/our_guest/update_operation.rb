class Users::OurGuest::UpdateOperation < Users::OurGuest::BaseOperation
  attr_reader :our_guest

  def call
    load_our_guest
    build_form
    validate { return true }
    update_our_guest
  end

  private

  def load_our_guest
    @our_guest = OurGuest.find(params[:id])
  end

  def build_form
    @form = Users::OurGuest::UpdateForm.new(permit_params)
  end

  def update_our_guest
    our_guest.update! form.attributes.reject { |_, v| v.blank?}
  end

end
