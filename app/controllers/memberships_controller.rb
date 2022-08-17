class MembershipsController < ApplicationController



    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index 
        members = Membership.all
        render json: members
    end 

    def create
        membership = Membership.create(member_params)
        render json: membership
    end 

   

private 

    def member_params
        params.permit(:gym_id, :client_id, :charge)
      end
    
    
  def render_not_found_response
    render json: { error: "Unporccesable" }, status: :unprocessable_entity
  end

end
