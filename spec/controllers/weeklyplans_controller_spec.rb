require "rails_helper"

describe WeeklyplansController do
	describe "#index" do
		it "renders index" do
			get :index

			expect(response).to render_template :index
		end
	end

	describe "#show" do
		it "renders show template" do
			weeklyplan = create(:weeklyplan)

			get :show, id: weeklyplan.id

			expect(response).to render_template :show
		end
	end

	describe "#new" do
		it "saves a weeklyplan with attributes" do
			get :new
			expect(assigns(:weeklyplan)).to be_a_new(Weeklyplan)
		end
	end

	describe "#update" do
		before(:each) do
			@weeklyplan = create(:weeklyplan)
			@request.env['HTTP_REFERER'] = '/weeklyplans/1'
		end
		context "With valid weeklyplan attributes" do
			it "locates the record" do
				put :update, id: @weeklyplan, weeklyplan: attributes_for(:weeklyplan, name: "Testing Update") 

				expect(assigns(:weeklyplan)).to eq(@weeklyplan)
			end

			it "Updated the atttributes" do
				put :update, id: @weeklyplan, weeklyplan: attributes_for(:weeklyplan, name: "Testing Update") 

				@weeklyplan.reload
				expect(@weeklyplan.name).to eq("Testing Update")
			end
		end

		context "With invalid weeklyplan attributes" do
			it "Doesn't save the weeklyplan" do
				put :update, id: @weeklyplan, weeklyplan: attributes_for(:weeklyplan, name: nil) 

				@weeklyplan.reload
				expect(@weeklyplan.name).not_to eq(nil)
			end

			it "re-renders edit template" do
				put :update, id: @weeklyplan, weeklyplan: attributes_for(:weeklyplan, name: nil) 

				expect(response).to redirect_to edit_weeklyplan_path @weeklyplan
			end
		end
	end

	describe "#destroy" do
		it "deletes the record" do
			weeklyplan = create(:weeklyplan)
			@request.env['HTTP_REFERER'] = '/weeklyplans'
			expect{ delete :destroy, id: weeklyplan }.to change(Weeklyplan,:count).by(-1)
		end 
	end
end