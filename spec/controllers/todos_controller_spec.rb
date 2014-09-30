require 'spec_helper'

RSpec.describe TodosController, :type => :controller do
	let!(:user) { create(:user) }
	before do
    sign_in user
  end

  describe "GET index" do
  	context "user signed in" do
  		it "renders index template" do
  			get :index
      	expect(response).to render_template("index")
  		end
  	end
  end

end
