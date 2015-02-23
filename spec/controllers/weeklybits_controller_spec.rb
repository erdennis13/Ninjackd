require "rails_helper"

describe WeeklybitsController do
	describe "#index" do
		it "renders index template" do
			get :index

			expect(response).to render_template :index
		end
	end

	describe "#show" do
		it "renders show template" do
			weeklybit = create(:weeklybit)

			get :show, id: weeklybit

			expect(response).to render_template :show
		end
	end

	describe "#new" do
		it "saves a weeklybit with attributes" do
			get :new
			expect(assigns(:weeklybit)).to be_a_new(Weeklybit)
		end
	end

	describe "#update" do
		it "saves an updated weeklybit" do
			weeklybit = create(:weeklybit)

			put :update, id: weeklybit, weeklybit: attributes_for(:weeklybit, workout_id: 2)

			weeklybit.reload
			expect(weeklybit.workout_id).to eq(2)
		end
	end

	describe "#destroy" do
		it "deletes the weeklybit" do
			@request.env['HTTP_REFERER'] = '/profile'
			weeklybit = create(:weeklybit)

			expect{ delete :destroy, id: weeklybit}.to change(Weeklybit,:count).by(-1)
		end
	end
end