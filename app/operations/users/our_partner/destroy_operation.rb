class Users::OurPartner::DestroyOperation < ApplicationOperation
  attr_reader :our_partner

  def call
    load_our_partner
    delete_our_partner
  end

  private

  def load_our_partner
    @our_partner = OurPartner.find(params[:id])
  end

  def delete_our_partner
    @our_partner.destroy
  end
end
