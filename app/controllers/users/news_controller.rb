class Users::NewsController < UserApplicationController

  def index
    operator   = Users::News::IndexOperation.new(params, current_user)
    operator.call
    @query     = operator.query
    @news    = operator.news
    @pagy      = operator.paginate
    @url       = users_news_index_path
  end

  def show
    operator = Users::News::ShowOperation.new(params, current_user)
    operator.call
    @new    = @form = operator.new
    @url     = users_news_path(@new)
  end

  def new
    operator = Users::News::NewOperation.new(params, current_user)
    operator.call
    @form    = operator.form
  end

  def create
    operator = Users::News::CreateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    new     = operator&.new

    if operator.error?
      flash.now[:alert] = I18n.t('fail.created')
      render :new
    else
      redirect_to users_news_index_path, notice: I18n.t('success.created')
    end
  end

  def update
    operator = Users::News::UpdateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    @new    = operator.new

    if operator.error?
      flash.now[:alert] = I18n.t('fail.updated')
      render :show
    else
      redirect_to users_news_path(@new), notice: I18n.t('success.updated')
    end
  end

  def destroy
    operator = Users::News::DestroyOperation.new(params, current_user)
    operator.call
    new     = operator.new

    if new.deleted?
      redirect_to users_news_index_path, notice: I18n.t('success.deleted')
    else
      redirect_to users_news_index_path, alert: I18n.t('fail.deleted')
    end
  end
end
