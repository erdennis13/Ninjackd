require "rails_helper"

describe PagesController do
	describe "#home" do
		it "renders root path" do
			expect(get :home).to render_template :home
		end
	end

	describe "#about" do
		it "renders about page" do
			expect(get :about).to render_template :about
		end
	end

	describe "#ethans_week" do
		before :each do
			user = create(:user)
			sign_in user
		end
		it "renders Ethan's week template" do
			expect(get :ethans_week).to render_template :ethans_week
		end

		render_views
		it "has the correct content" do
			get :ethans_week

			expect(response.body).to have_css "h1", text: "Take a look at what I'm up to this week!"
		end
	end

	describe "#paypal_checkout" do
		it "Routes to the paypal page" do
			matcher = "/^(?=[^,]+,[^,]+$)[a-zA-Z,]{1,20}$/"
			get :paypal_checkout

			expect(response).to redirect_to "https://www.sandbox.paypal.com/cgi-bin/webscr?cmd=_express-checkout&token=#{matcher}&useraction=commit"
		end
	end
end