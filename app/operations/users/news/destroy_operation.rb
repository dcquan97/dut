class Users::News::DestroyOperation < ApplicationOperation
  attr_reader :new

  def call
    load_new
    delete_new
  end

  private

  def load_new
    @new = New.find(params[:id])
  end

  def delete_new
    @new.destroy
  end
end
