require 'spec_helper'

describe WelcomeController do
	describe "GET home" do
    
    it "redirects to home when user not singed in" do
      get :home
      expect(response).to render_template("home")
    end
  end
end