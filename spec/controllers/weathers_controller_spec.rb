require 'rails_helper'

RSpec.describe WeathersController, :type => :controller do

describe "GET #index" do
	it "responds with 200 status response" do
		 get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  it "checks the template being rendered" do
		 get :index 
      assert_template("weathers/index", "layouts/application")
   end

end

end