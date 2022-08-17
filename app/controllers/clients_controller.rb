class ClientsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    # HOW TO DO VALIDATION
    def index 
        clients = Client.all 
        render json: clients 
    end 

    def show 
        client = Client.find(params[:id])
        render json: client, include: :memberships
    end 

    private     
    def render_not_found_response
      render json: { error: "client not found" }, status: :unprocessable_entity
    end

end
