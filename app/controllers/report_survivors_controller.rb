class ReportSurvivorsController < ApplicationController
  before_action :set_report_survivor, only: [:show, :update, :destroy]


  api :GET, '/report_survivors', 'List of all survivors names, by alphabetic order, with an identification to know who was abducted'
  param_group :report_survivors_get, Api::ReportSurvivorsApi

  # GET /report_survivors
  def index
    @report_survivors = ReportSurvivor.all.as_json.sort_by{ |k| k[:name] }
    # puts @report_survivors
    count_report = @report_survivors.size.to_f
    not_abd = 0.0
    abd = 0.0
    @report_survivors.each do |report|
      not_abd += 1.0 unless report["has_abd"] == true
      abd += 1.0 unless report["has_abd"] == false
    end
    h = {"total_survivors" => "#{count_report.to_i}",
    "abd"=> "#{abd.to_i}", "not-abd"=> "#{not_abd.to_i}",
    "%_abd" => "#{(abd/count_report)*100.0}%",
    "%_not_abd" => "#{(not_abd/count_report)*100}%"}
    render json: @report_survivors.unshift(h)
  end

  api :GET, '/survivors/:id/report_survivor/:id2', 'Report abduction from a specific Survivor by GET'
  param_group :report_survivors, Api::ReportSurvivorsApi
  # GET /report_survivors
  def report
    @survivor = Survivor.find(params[:survivor_id]).report_survivor
    if params[:survivor_id]
      @survivor[:abd_report] == 3 ?  @survivor[:has_abd] = true : @survivor[:abd_report] += 1
      @survivor.save
    end
    render json: @survivor
  end

  api :GET, '/report_survivors/:id', 'Get report data from a specific Survivor abducted or not abducted'
  api :GET, '/survivors/:id/report_survivor', 'Get report data from a specific Survivor abducted or not abducted'
  param_group :report_survivors_get, Api::ReportSurvivorsApi
  # GET /report_survivors/1
  def show
    if params[:survivor_id]
      render json: @survivor.report_survivor
    else
      render json: @report_survivor
    end
  end

  # POST /report_survivors
  def create
    @report_survivor = ReportSurvivor.new(report_survivor_params)

    if @report_survivor.save
      render json: @report_survivor, status: :created, location: @report_survivor
    else
      render json: @report_survivor.errors, status: :unprocessable_entity
    end
  end

  api :PATCH, 'report_survivor/:id', 'Get report data from a specific Survivor abducted or not abducted by PATCH'
  param_group :report_survivors_patch, Api::ReportSurvivorsApi
  # PATCH/PUT /report_survivors/1
  def update
    if @report_survivor.update(report_survivor_params)
      @report_survivor[:has_abd] = true if @report_survivor[:abd_report] == 3
      @report_survivor[:has_abd] = false if @report_survivor[:abd_report] != 3
      @report_survivor.save
      render json: @report_survivor
    else
      render json: @report_survivor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /report_survivors/1
  def destroy
    @report_survivor.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_report_survivor
    if params[:survivor_id]
      @survivor = Survivor.find(params[:survivor_id])
      return @survivor
    end
    @report_survivor = ReportSurvivor.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def report_survivor_params
    params.require(:report_survivor).permit(:abd_report)
  end
end
