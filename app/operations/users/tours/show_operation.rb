class Users::Tours::ShowOperation < Users::Tours::BaseOperation
  attr_reader :tour

  private

  def build_form
    @tour = Tour.find(params[:id])
  end
end
