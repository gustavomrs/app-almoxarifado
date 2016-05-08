module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in User.create(login: 'admin', password: 'admin123') # Using factory girl as an example
    end
  end
end
