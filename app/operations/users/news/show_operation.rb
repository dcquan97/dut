class Users::News::ShowOperation < Users::News::BaseOperation
  attr_reader :new

  private

  def build_form
    @new = New.find(params[:id])
  end
end
