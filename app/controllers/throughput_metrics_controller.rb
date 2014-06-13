class ThroughputMetricsController < ApplicationController
  before_action :set_throughput_metric, only: [:show, :edit, :update, :destroy]

  # GET /throughput_metrics
  # GET /throughput_metrics.json
  def index
    @throughput_metrics = ThroughputMetric.all
  end

  # GET /throughput_metrics/1
  # GET /throughput_metrics/1.json
  def show
  end

  # GET /throughput_metrics/new
  def new
    @throughput_metric = ThroughputMetric.new
  end

  # GET /throughput_metrics/1/edit
  def edit
  end

  # POST /throughput_metrics
  # POST /throughput_metrics.json
  def create
    @throughput_metric = ThroughputMetric.new(throughput_metric_params)

    respond_to do |format|
      if @throughput_metric.save
        format.html { redirect_to @throughput_metric, notice: 'Throughput metric was successfully created.' }
        format.json { render action: 'show', status: :created, location: @throughput_metric }
      else
        format.html { render action: 'new' }
        format.json { render json: @throughput_metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /throughput_metrics/1
  # PATCH/PUT /throughput_metrics/1.json
  def update
    respond_to do |format|
      if @throughput_metric.update(throughput_metric_params)
        format.html { redirect_to @throughput_metric, notice: 'Throughput metric was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @throughput_metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /throughput_metrics/1
  # DELETE /throughput_metrics/1.json
  def destroy
    @throughput_metric.destroy
    respond_to do |format|
      format.html { redirect_to throughput_metrics_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_throughput_metric
      @throughput_metric = ThroughputMetric.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def throughput_metric_params
      params.require(:throughput_metric).permit(:user_id, :description)
    end
end
