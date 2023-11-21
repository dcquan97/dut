class Users::OurGuest::ShowOperation < Users::OurGuest::BaseOperation
  attr_reader :our_guest

  private

  def build_form
    @our_guest = OurGuest.find(params[:id])
  end
end
