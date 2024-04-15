class Users::PostsController < UserApplicationController

  def index
    operator   = Users::Posts::IndexOperation.new(params, current_user)
    operator.call
    @query     = operator.query
    @posts    = operator.posts
    @pagy      = operator.paginate
    @url       = users_posts_path
  end

  def show
    operator = Users::Posts::ShowOperation.new(params, current_user)
    operator.call
    @post    = @form = operator.post
    @url     = users_post_path(@post)
  end

  def new
    operator = Users::Posts::NewOperation.new(params, current_user)
    operator.call
    @form    = operator.form
  end

  def create
    operator = Users::Posts::CreateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    post     = operator&.post

    if operator.error?
      flash.now[:alert] = I18n.t('fail.created')
      render :new
    else
      redirect_to users_posts_path, notice: I18n.t('success.created')
    end
  end

  def update
    operator = Users::Posts::UpdateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    @post    = operator.post

    if operator.error?
      flash.now[:alert] = I18n.t('fail.updated')
      render :show
    else
      redirect_to users_post_path(@post), notice: I18n.t('success.updated')
    end
  end

  def destroy
    operator = Users::Posts::DestroyOperation.new(params, current_user)
    operator.call
    post     = operator.post

    if post.deleted?
      redirect_to users_posts_path, notice: I18n.t('success.deleted')
    else
      redirect_to users_posts_path, alert: I18n.t('fail.deleted')
    end
  end
end
