class Users::Posts::DestroyOperation < ApplicationOperation
  attr_reader :post

  def call
    load_post
    delete_post
  end

  private

  def load_post
    @post = Post.find(params[:id])
  end

  def delete_post
    @post.destroy
  end
end
