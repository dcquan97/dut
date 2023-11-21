class Users::OurGuest::DestroyOperation < ApplicationOperation
  attr_reader :our_guest

  def call
    load_our_guest
    delete_our_guest
  end

  private

  def load_our_guest
    @our_guest = OurGuest.find(params[:id])
  end

  def delete_our_guest
    @our_guest.destroy
  end
end
