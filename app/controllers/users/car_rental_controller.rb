class Users::CarRentalController < UserApplicationController

  def index
    operator   = Users::CarRental::IndexOperation.new(params, current_user)
    operator.call
    @query     = operator.query
    @car_rental    = operator.car_rental
    @pagy      = operator.paginate
    @url       = users_car_rental_index_path
  end

  def show
    operator = Users::CarRental::ShowOperation.new(params, current_user)
    operator.call
    @car_rental    = @form = operator.car_rental
    @url     = users_car_rental_path(@car_rental)
  end

  def new
    operator = Users::CarRental::NewOperation.new(params, current_user)
    operator.call
    @form    = operator.form
  end

  def create
    operator = Users::CarRental::CreateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    car_rental     = operator&.car_rental

    if operator.error?
      flash.now[:alert] = I18n.t('fail.created')
      render :new
    else
      redirect_to users_car_rental_index_path, notice: I18n.t('success.created')
    end
  end

  def update
    operator = Users::CarRental::UpdateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    @car_rental    = operator.car_rental

    if operator.error?
      flash.now[:alert] = I18n.t('fail.updated')
      render :show
    else
      redirect_to users_car_rental_path(@car_rental), notice: I18n.t('success.updated')
    end
  end

  def destroy
    operator = Users::CarRental::DestroyOperation.new(params, current_user)
    operator.call
    car_rental     = operator.car_rental

    if car_rental.deleted?
      redirect_to users_car_rental_index_path, notice: I18n.t('success.deleted')
    else
      redirect_to users_car_rental_index_path, alert: I18n.t('fail.deleted')
    end
  end
end
