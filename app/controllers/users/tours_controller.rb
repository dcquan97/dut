class Users::ToursController < UserApplicationController

  def index
    operator   = Users::Tours::IndexOperation.new(params, current_user)
    operator.call
    @query     = operator.query
    @tours    = operator.tours
    @pagy      = operator.paginate
    @url       = users_tours_path
  end

  def show
    operator = Users::Tours::ShowOperation.new(params, current_user)
    operator.call
    @tour    = @form = operator.tour
    @url     = users_tour_path(@tour)
  end

  def new
    operator = Users::Tours::NewOperation.new(params, current_user)
    operator.call
    @form    = operator.form
  end

  def create
    operator = Users::Tours::CreateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    tour     = operator&.tour

    if operator.error?
      flash.now[:alert] = I18n.t('fail.created')
      render :new
    else
      redirect_to users_tours_path, notice: I18n.t('success.created')
    end
  end

  def update
    operator = Users::Tours::UpdateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    @tour    = operator.tour

    if operator.error?
      flash.now[:alert] = I18n.t('fail.updated')
      render :show
    else
      redirect_to users_tour_path(@tour), notice: I18n.t('success.updated')
    end
  end

  def destroy
    operator = Users::Tours::DestroyOperation.new(params, current_user)
    operator.call
    tour     = operator.tour

    if tour.deleted?
      redirect_to users_tours_path, notice: I18n.t('success.deleted')
    else
      redirect_to users_tours_path, alert: I18n.t('fail.deleted')
    end
  end
end
