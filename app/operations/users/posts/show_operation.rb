class Users::Posts::ShowOperation < Users::Posts::BaseOperation
  attr_reader :post

  private

  def build_form
    @post = Post.find(params[:id])
  end
end
