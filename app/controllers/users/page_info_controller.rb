class Users::PageInfoController < UserApplicationController

  def index
    operator   = Users::PageInfo::IndexOperation.new(params, current_user)
    operator.call
    @query     = operator.query
    @page_info    = operator.page_info
    @pagy      = operator.paginate
    @url       = users_page_info_index_path
  end

  def show
    operator = Users::PageInfo::ShowOperation.new(params, current_user)
    operator.call
    @page_info    = @form = operator.page_info
    @url     = users_page_info_path(@page_info)
  end

  def new
    operator = Users::PageInfo::NewOperation.new(params, current_user)
    operator.call
    @form    = operator.form
  end

  def create
    operator = Users::PageInfo::CreateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    page_info     = operator&.page_info

    if operator.error?
      flash.now[:alert] = I18n.t('fail.created')
      render :new
    else
      redirect_to users_page_info_index_path, notice: I18n.t('success.created')
    end
  end

  def update
    operator = Users::PageInfo::UpdateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    @page_info    = operator.page_info

    if operator.error?
      flash.now[:alert] = I18n.t('fail.updated')
      render :show
    else
      redirect_to users_page_info_path(@page_info), notice: I18n.t('success.updated')
    end
  end

  def destroy
    operator = Users::PageInfo::DestroyOperation.new(params, current_user)
    operator.call
    page_info     = operator.page_info

    if page_info.deleted?
      redirect_to users_page_info_index_path, notice: I18n.t('success.deleted')
    else
      redirect_to users_page_info_index_path, alert: I18n.t('fail.deleted')
    end
  end
end
