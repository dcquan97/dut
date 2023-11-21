class Users::OurTeam::DestroyOperation < ApplicationOperation
  attr_reader :our_team

  def call
    load_our_team
    delete_our_team
  end

  private

  def load_our_team
    @our_team = OurTeam.find(params[:id])
  end

  def delete_our_team
    @our_team.destroy
  end
end
