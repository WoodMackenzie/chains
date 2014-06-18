class ThroughputsController < ApplicationController
  before_action :set_throughput, only: [:show, :edit, :update, :destroy]

  # GET /throughputs
  # GET /throughputs.json
  def index
    @throughputs = Throughput.all
  end

  # GET /throughputs/1
  # GET /throughputs/1.json
  def show
  end

  # GET /throughputs/new
  def new
    @throughput = Throughput.new(:processing_unit_id => params[:processing_unit_id], :metric_id => params[:metric_id])
    @throughput.user_id = current_user.id
  end

  # GET /throughputs/1/edit
  def edit
  end

  # POST /throughputs
  # POST /throughputs.json
  def create
    @throughput = Throughput.new(throughput_params)
    @throughput.processing_unit_id = ProcessingUnit.find(Name.where("name = ? AND nameable_type = ?", 
      extra_params[:unit_description], "ProcessingUnit").first.nameable_id).id
    @throughput.metric_id = ThroughputMetric.where("description = ?", extra_params[:metric_description]).first.id
    @throughput.amount_unit_id = UnitsOfMeasure.where("description = ?", extra_params[:amount_unit_description]).first.id
    @throughput.time_unit_id = UnitsOfMeasure.where("description = ?", extra_params[:time_unit_description]).first.id
    @throughput.commodity_id = Commodity.where("description = ?", extra_params[:commodity_description]).first.id

    respond_to do |format|
      if @throughput.save
        format.html { redirect_to @throughput, notice: 'Throughput was successfully created.' }
        format.json { render action: 'show', status: :created, location: @throughput }
      else
        format.html { render action: 'new' }
        format.json { render json: @throughput.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /throughputs/1
  # PATCH/PUT /throughputs/1.json
  def update
    @throughput.user_id = current_user.id
    @throughput.processing_unit_id = ProcessingUnit.find(Names.where("name = ? AND nameable_type = ?", 
      extra_params[:unit_description], "ProcessingUnit").first.nameable_id)
    @throughput.metric_id = ThroughputMetric.where("description = ?", extra_params[:metric_description]).first.id
    @throughput.amount_unit_id = UnitsOfMeasure.where("description = ?", extra_params[:amount_unit_description]).first.id
    @throughput.time_unit_id = UnitsOfMeasure.where("description = ?", extra_params[:time_unit_description]).first.id
    @throughput.commodity_id = Commodity.where("description = ?", extra_params[:commodity_description]).first.id

    respond_to do |format|
      if @throughput.update(throughput_params)
        format.html { redirect_to @throughput, notice: 'Throughput was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @throughput.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /throughputs/1
  # DELETE /throughputs/1.json
  def destroy
    @throughput.destroy
    respond_to do |format|
      format.html { redirect_to throughputs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_throughput
      @throughput = Throughput.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def throughput_params
      params.require(:throughput).permit(:user_id, :processing_unit_id, :metric_id, :amount_unit_id, :time_unit_id, :commodity_id, :value, :active_date)
    end

    def extra_params
      params.require(:throughput).permit(:unit_description, :metric_description, :amount_unit_description, :time_unit_description, :commodity_description)
    end
end
