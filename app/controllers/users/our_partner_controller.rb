class Users::OurPartnerController < UserApplicationController

  def index
    operator   = Users::OurPartner::IndexOperation.new(params, current_user)
    operator.call
    @query     = operator.query
    @our_partner    = operator.our_partner
    @pagy      = operator.paginate
    @url       = users_our_partner_index_path
  end

  def show
    operator = Users::OurPartner::ShowOperation.new(params, current_user)
    operator.call
    @our_partner    = @form = operator.our_partner
    @url     = users_our_partner_path(@our_partner)
  end

  def new
    operator = Users::OurPartner::NewOperation.new(params, current_user)
    operator.call
    @form    = operator.form
  end

  def create
    operator = Users::OurPartner::CreateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    our_partner     = operator&.our_partner

    if operator.error?
      flash.now[:alert] = I18n.t('fail.created')
      render :new
    else
      redirect_to users_our_partner_index_path, notice: I18n.t('success.created')
    end
  end

  def update
    operator = Users::OurPartner::UpdateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    @our_partner    = operator.our_partner

    if operator.error?
      flash.now[:alert] = I18n.t('fail.updated')
      render :show
    else
      redirect_to users_our_partner_path(@our_partner), notice: I18n.t('success.updated')
    end
  end

  def destroy
    operator = Users::OurPartner::DestroyOperation.new(params, current_user)
    operator.call
    our_partner     = operator.our_partner

    if our_partner.deleted?
      redirect_to users_our_partner_index_path, notice: I18n.t('success.deleted')
    else
      redirect_to users_our_partner_index_path, alert: I18n.t('fail.deleted')
    end
  end
end
