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
			#Unsure about how to test this. Will have to come back to this one

			# stub_request(:post, "https://api-3t.sandbox.paypal.com/nvp").
   #        with(:body => {"AMT"=>"9.99", "CANCELURL"=>"http://test.host/", "CURRENCYCODE"=>"USD", "DESC"=>"Ninjackd Subscription", "L_BILLINGAGREEMENTDESCRIPTION0"=>"Ninjackd Subscription", "L_BILLINGTYPE0"=>"RecurringPayments", "METHOD"=>"SetExpressCheckout", "NOSHIPPING"=>"1", "PAYMENTREQUEST_0_AMT"=>"9.99", "PAYMENTREQUEST_0_CURRENCYCODE"=>"USD", "PAYMENTREQUEST_0_DESC"=>"Ninjackd Subscription", "PAYMENTREQUEST_0_PAYMENTACTION"=>"Authorization", "PWD"=>"YCBQEVMJ4G3VZ92A", "RETURNURL"=>"http://test.host/users/sign_up", "SIGNATURE"=>"AFcWxV21C7fd0v3bYYYRCpSSRl31A04tHaO4E.Hfp5Q3FVkg9-S6znzB", "USER"=>"ethan-facilitator_api1.ninjackd.com", "VERSION"=>"72.0"},
   #             :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'PayPal::Recurring/1.1.0'}).
   #        to_return(:status => 200, :body => "", :headers => {})

   # #   stub_request(:any, "https://api-3t.sandbox.paypal.com/nvp")

			# post :paypal_checkout

			# expect(response).to be_an_instance_of(String)

		end
	end

	describe "#cancel_account" do
		before(:each) do
			stub_request(:post, "https://api-3t.sandbox.paypal.com/nvp").
         with(:body => {"ACTION"=>"Cancel", "METHOD"=>"ManageRecurringPaymentsProfileStatus", "PROFILEID"=>true, "PWD"=>"YCBQEVMJ4G3VZ92A", "SIGNATURE"=>"AFcWxV21C7fd0v3bYYYRCpSSRl31A04tHaO4E.Hfp5Q3FVkg9-S6znzB", "USER"=>"ethan-facilitator_api1.ninjackd.com", "VERSION"=>"72.0"},
              :headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/x-www-form-urlencoded', 'User-Agent'=>'PayPal::Recurring/1.1.0'}).
         to_return(:status => 200, :body => "", :headers => {})
     	user = create(:user)
			sign_in user
		end
		it "redirects to root path" do
			post :cancel_account

			expect(response).to redirect_to root_path
		end

		it "deletes the user" do
			expect{ post :cancel_account }.to change(User,:count).by(-1)
		end
	end
end