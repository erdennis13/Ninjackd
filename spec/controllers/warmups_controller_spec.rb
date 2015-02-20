require "rails_helper"

describe WarmupsController do
	describe "#create" do
		it "creates warmup" do
			post :create, warmup: attributes_for(:warmup)

			expect(response).to redirect_to warmup_path assigns(:warmup)
		end
	end

	describe "#update" do
		before(:each) do
			@warmup = create(:warmup)
		end

		context "with valid warmup attributes" do
			it "finds the correct warmup" do
				put :update, id: @warmup, warmup: attributes_for(:warmup)

				expect(assigns(:warmup)).to eq(@warmup)
			end

			it "updates the warmup" do
				put :update, id: @warmup, warmup: attributes_for(:warmup, name: "Updated name")

				@warmup.reload
				expect(@warmup.name).to eq("Updated name")
			end
		end

		context "with invalid warmup attributes" do
			it "does not update the warmup" do
				put :update, id: @warmup, warmup: attributes_for(:warmup, name: nil, description: nil)

				@warmup.reload
				expect(@warmup.name).not_to eq(nil)
				expect(@warmup.description).not_to eq(nil)
			end

			it "redirects to edit warmup path" do
				put :update, id: @warmup, warmup: attributes_for(:warmup, name: nil)

				expect(response).to redirect_to edit_warmup_path @warmup
			end
		end
	end
end