class ReportSurvivorsController < ApplicationController
  before_action :set_report_survivor, only: [:show, :update, :destroy]

  # GET /report_survivors
  def index
    @report_survivors = ReportSurvivor.all.as_json.sort_by{ |k| k[:name] }
    # puts @report_survivors
    count_report = @report_survivors.size
    not_abd = 0
    abd = 0
    @report_survivors.each do |report|
        not_abd += 1 unless report["has_abd"] == true
        abd += 1 unless report["has_abd"] == false
    end
    puts not_abd
    puts abd
    render json: @report_survivors
  end

  # GET /report_survivors
  def id
    @survivor = Survivor.find(params[:survivor_id]).report_survivor
    if params[:survivor_id]
      @survivor[:abd_report] == 3 ?  @survivor[:has_abd] = true : @survivor[:abd_report] += 1
      @survivor.save
    end
    render json: @survivor
  end

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

  # PATCH/PUT /report_survivors/1
  def update
    if @report_survivor.update(report_survivor_params)
      if @report_survivor[:abd_report] == 3
        @report_survivor[:has_abd] = true
        @report_survivor.save
      end
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
