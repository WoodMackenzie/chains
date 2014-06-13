class MeasureTypesController < ApplicationController
  before_action :set_measure_type, only: [:show, :edit, :update, :destroy]

  # GET /measure_types
  # GET /measure_types.json
  def index
    @measure_types = MeasureType.all
  end

  # GET /measure_types/1
  # GET /measure_types/1.json
  def show
  end

  # GET /measure_types/new
  def new
    @measure_type = MeasureType.new
  end

  # GET /measure_types/1/edit
  def edit
  end

  # POST /measure_types
  # POST /measure_types.json
  def create
    @measure_type = MeasureType.new(measure_type_params)

    respond_to do |format|
      if @measure_type.save
        format.html { redirect_to @measure_type, notice: 'Measure type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @measure_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @measure_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /measure_types/1
  # PATCH/PUT /measure_types/1.json
  def update
    respond_to do |format|
      if @measure_type.update(measure_type_params)
        format.html { redirect_to @measure_type, notice: 'Measure type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @measure_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /measure_types/1
  # DELETE /measure_types/1.json
  def destroy
    @measure_type.destroy
    respond_to do |format|
      format.html { redirect_to measure_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_measure_type
      @measure_type = MeasureType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def measure_type_params
      params.require(:measure_type).permit(:user_id, :description)
    end
end
