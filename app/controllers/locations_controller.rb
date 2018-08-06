  class LocationsController < ApplicationController
    before_action :set_location

    # DELETE /survivors/1/location
    def destroy
      @survivor.location.destroy
    end

    # POST /survivors/1/location
    def create
      @survivor.location = Location.new(location_params)

      if @survivor.save
        render json: @survivor.location, status: :created, location: survivor_location_url(@survivor)
      else
        render json: @survivor.errors, status: :unprocessable_entity
      end
    end

    # PATCH /survivors/1/location
    def update
      if @survivor.location.update(location_params)
        render json: @survivor.location
      else
        render json: @survivor.errors, status: :unprocessable_entity
      end
    end

    # GET /survivors/1/location
    def show
      render json: @survivor.location
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_location
        @survivor = Survivor.find(params[:survivor_id])
      end

      def location_params
        params.require(:survivor).permit(:id)
      end
  end
