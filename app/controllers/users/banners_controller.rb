class Users::BannersController < UserApplicationController

  def index
    operator   = Users::Banners::IndexOperation.new(params, current_user)
    operator.call
    @query     = operator.query
    @banner    = operator.banners
    @pagy      = operator.paginate
    @url       = users_banners_path
  end

  def show
    operator = Users::Banners::ShowOperation.new(params, current_user)
    operator.call
    @banner    = @form = operator.banner
    @url     = users_banners_path(@banner)
  end

  def new
    operator = Users::Banners::NewOperation.new(params, current_user)
    operator.call
    @form    = operator.form
  end

  def create
    operator = Users::Banners::CreateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    banner     = operator&.banner

    if operator.error?
      flash.now[:alert] = I18n.t('fail.created')
      render :new
    else
      redirect_to users_banners_path, notice: I18n.t('success.created')
    end
  end

  def update
    operator = Users::Banners::UpdateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    @banner    = operator.banner

    if operator.error?
      flash.now[:alert] = I18n.t('fail.updated')
      render :show
    else
      redirect_to users_banners_path(@banner), notice: I18n.t('success.updated')
    end
  end

  def destroy
    operator = Users::Banners::DestroyOperation.new(params, current_user)
    operator.call
    banner     = operator.banner

    if banner.deleted?
      redirect_to users_banners_path, notice: I18n.t('success.deleted')
    else
      redirect_to users_banners_path, alert: I18n.t('fail.deleted')
    end
  end
end
