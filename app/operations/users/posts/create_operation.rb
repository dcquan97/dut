class Users::Posts::CreateOperation < Users::Posts::BaseOperation
  attr_reader :post

  def call
    build_form
    validate { return true }
    create_post
  end

  private

  def build_form
    @form = Users::Posts::CreateForm.new(permit_params)
  end

  def create_post
    @post = Post.create!(@form.attributes)
  end
end
