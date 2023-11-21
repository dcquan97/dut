class Users::OurGuestController < UserApplicationController

  def index
    operator   = Users::OurGuest::IndexOperation.new(params, current_user)
    operator.call
    @query     = operator.query
    @our_guest    = operator.our_guest
    @pagy      = operator.paginate
    @url       = users_our_guest_index_path
  end

  def show
    operator = Users::OurGuest::ShowOperation.new(params, current_user)
    operator.call
    @our_guest    = @form = operator.our_guest
    @url     = users_our_guest_path(@our_guest)
  end

  def new
    operator = Users::OurGuest::NewOperation.new(params, current_user)
    operator.call
    @form    = operator.form
  end

  def create
    operator = Users::OurGuest::CreateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    our_guest     = operator&.our_guest

    if operator.error?
      flash.now[:alert] = I18n.t('fail.created')
      render :new
    else
      redirect_to users_our_guest_index_path, notice: I18n.t('success.created')
    end
  end

  def update
    operator = Users::OurGuest::UpdateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    @our_guest    = operator.our_guest

    if operator.error?
      flash.now[:alert] = I18n.t('fail.updated')
      render :show
    else
      redirect_to users_our_guest_path(@our_guest), notice: I18n.t('success.updated')
    end
  end

  def destroy
    operator = Users::OurGuest::DestroyOperation.new(params, current_user)
    operator.call
    our_guest     = operator.our_guest

    if our_guest.deleted?
      redirect_to users_our_guest_index_path, notice: I18n.t('success.deleted')
    else
      redirect_to users_our_guest_index_path, alert: I18n.t('fail.deleted')
    end
  end
end
