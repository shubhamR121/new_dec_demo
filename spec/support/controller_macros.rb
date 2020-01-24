# frozen_string_literal: true

module ControllerMacros
  # def login_normal_with_condition(type)
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:user]
  #     user = FactoryBot.create(:user)
  #     if type != "authorized"
  #       FactoryBot.create_list(:artist, 1, user_id: user.id)
  #     end
  #     sign_in user
  #   end
  # end

  # def login_normal
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:user]
  #     user = FactoryBot.create(:user)
  #     sign_in user
  #   end
  # end

  # def login_user
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:user]
  #     user = FactoryBot.create(:user)
  #     user.add_role('admin')
  #     # or set a confirmed_at inside the factory.
  #     # Only necessary if you are using the "confirmable" module
  #     # user.confirm!
  #     sign_in user
  #   end
  # end
end