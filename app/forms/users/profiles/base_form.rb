class Users::Profiles::BaseForm < ApplicationForm
  attribute :email,                 :string
  attribute :name,                  :string
  attribute :avatar,                :string
  attribute :current_password,      :string
  attribute :password,              :string
  attribute :password_confirmation, :string
end
