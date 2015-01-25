require "rails_helper"

describe WorkoutsController do
	describe "#index" do
		it "renders workout list" do

			sign_in("user@example.com")
			get :index

			expect(response).to render_template "index"
		end
	end
end