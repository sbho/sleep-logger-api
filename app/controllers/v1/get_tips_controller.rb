class V1::GetTipsController < ApplicationController
    # Anyone should be able to get a random tip
    skip_before_action :authenticate_request

    #returns a random tip
    def get_tips
        render json: Tip.order("RANDOM()").first, status: :ok
    end
end