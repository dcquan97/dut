class Users::Posts::UpdateOperation < Users::Posts::BaseOperation
  attr_reader :post

  def call
    load_post
    build_form
    validate { return true }
    update_post
  end

  private

  def load_post
    @post = Post.find(params[:id])
  end

  def build_form
    @form = Users::Posts::UpdateForm.new(permit_params)
  end

  def update_post
    post.update! form.attributes.reject { |_, v| v.blank?}
  end

end
