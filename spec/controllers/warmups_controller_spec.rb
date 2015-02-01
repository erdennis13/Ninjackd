require "rails_helper"

describe WarmupsController do
	describe "#create" do
		it "creates warmup" do
			post :create, warmup: warmup

			expect(response).to redirect_to warmup_path(Warmup.last)
		end
	end
	def warmup
		warmup1 = {name: "Warmup1", description: "Test description for warmup"}
	end
end