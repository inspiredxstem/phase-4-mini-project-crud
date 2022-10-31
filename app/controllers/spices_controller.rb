class SpicesController < ApplicationController
    wrap_parameters format: []

    def index
        spices = Spice.all
        render json: spices, status: :ok
    end

    def show
        spices = Spice.find_by(params[:id])
        if spices
            render json: spices, except: [:created_at, :updated_at], status: :ok
        else
            render json: { error: "Spice Not Found" }, status: :not_found
        end
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spices = Spice.find_by(params[:id])
        if spices
           spices.update(spice_params)
           render json: spices
        else
            render json: { error: "Spice Not Found" }, status: :not_found
        end
    end

    def destroy
        spices = Spice.find_by(params[:id])
        if spices
            spices.destroy
            head :no_content
        else
            render json: { error: "Spice Not Found" }, status: :not_found
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end
end
