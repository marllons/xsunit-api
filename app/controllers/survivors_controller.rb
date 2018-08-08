class SurvivorsController < ApplicationController
  before_action :set_survivor, only: [:show, :update, :destroy]

  api :GET, '/survivors', 'Show all survivors of xSunit'
  param_group :survivors_get, Api::SurvivorsApi
  # GET /survivors
  def index
    @survivors = Survivor.all
    render json: @survivors#, except: [:gender_id, :created_at, :updated_at]
  end

  api :GET, '/survivors/:id', 'Show a survivor of xSunit'
  param_group :survivors_get, Api::SurvivorsApi
  # GET /survivors/1
  def show
    render json: @survivor
  end

  api :POST, '/survivors', 'If you find a survivor, register a survivor of xSunit!'
  param_group :survivors_post, Api::SurvivorsApi
  # POST /survivors
  def create
    @survivor = Survivor.new(survivor_params)
    if @survivor.save
      if params.require(:location).has_key?(:latitude) && params.require(:location).has_key?(:longitude)
        Location.create!(latitude: params[:location][:latitude], longitude: params[:location][:longitude], survivor: @survivor)
      else
        Location.create!(latitude: 0, longitude: 0, survivor: @survivor)
      end
      ReportSurvivor.create!(has_abd: false, abd_report: 0, survivor: @survivor)
      render json: @survivor, status: :created, location: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  api :PATCH, '/survivors/:id', 'Edit data of xSunit survivors'
  param_group :survivors_post, Api::SurvivorsApi
  # PATCH/PUT /survivors/1
  def update
    if @survivor.update(survivor_params)
      render json: @survivor
    else
      render json: @survivor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /survivors/1
  def destroy
    @survivor.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_survivor
    @survivor = Survivor.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def survivor_params
    params.require(:survivor).permit(
      :name, :birthday, :gender_id,
      report_survivor_attributes: [:has_abd, :abd_report],
      location_attributes: [:latitude, :longitude]
    )
  end
end
