class Users::OurTeamController < UserApplicationController

  def index
    operator   = Users::OurTeam::IndexOperation.new(params, current_user)
    operator.call
    @query     = operator.query
    @our_team    = operator.our_team
    @pagy      = operator.paginate
    @url       = users_our_team_index_path
  end

  def show
    operator = Users::OurTeam::ShowOperation.new(params, current_user)
    operator.call
    @our_team    = @form = operator.our_team
    @url     = users_our_team_path(@our_team)
  end

  def new
    operator = Users::OurTeam::NewOperation.new(params, current_user)
    operator.call
    @form    = operator.form
  end

  def create
    operator = Users::OurTeam::CreateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    our_team     = operator&.our_team

    if operator.error?
      flash.now[:alert] = I18n.t('fail.created')
      render :new
    else
      redirect_to users_our_team_index_path, notice: I18n.t('success.created')
    end
  end

  def update
    operator = Users::OurTeam::UpdateOperation.new(params, current_user)
    operator.call
    @form    = operator.form
    @our_team    = operator.our_team

    if operator.error?
      flash.now[:alert] = I18n.t('fail.updated')
      render :show
    else
      redirect_to users_our_team_path(@our_team), notice: I18n.t('success.updated')
    end
  end

  def destroy
    operator = Users::OurTeam::DestroyOperation.new(params, current_user)
    operator.call
    our_team     = operator.our_team

    if our_team.deleted?
      redirect_to users_our_team_index_path, notice: I18n.t('success.deleted')
    else
      redirect_to users_our_team_index_path, alert: I18n.t('fail.deleted')
    end
  end
end
