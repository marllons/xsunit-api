class GendersController < ApplicationController
  before_action :set_gender, only: [:show, :update, :destroy]

  api :GET, '/genders', 'Get all genders of Survivors'
  param_group :genders_get, Api::GendersApi
  # GET /genders
  def index
    @genders = Gender.all
    render json: @genders
  end

  api :GET, '/genders/:id', 'Get a gender'
  api :GET, '/survivors/:id/gender', 'Get a gender of a survivor'
  
  param_group :genders_get, Api::GendersApi
  # GET /genders/1
  def show
    render json: @gender
  end

  api :POST, '/genders', 'Save a new gender'
  param_group :genders_post, Api::GendersApi
  # POST /genders
  def create
    @gender = Gender.new(gender_params)

    if @gender.save
      render json: @gender, status: :created, location: @gender
    else
      render json: @gender.errors, status: :unprocessable_entity
    end
  end

  api :PATCH, '/genders/:id', 'Edit a gender of Survivors'
  param_group :genders_post, Api::GendersApi
  # PATCH/PUT /genders/1
  def update
    if @gender.update(gender_params)
      render json: @gender
    else
      render json: @gender.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genders/1
  def destroy
    @gender.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gender
      if params[:survivor_id]
        @gender = Survivor.find(params[:survivor_id]).gender
        return @gender
      end
      @gender = Gender.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gender_params
      params.require(:gender).permit(:description)
    end
end
