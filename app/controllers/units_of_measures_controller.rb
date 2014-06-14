class UnitsOfMeasuresController < ApplicationController
  before_action :set_units_of_measure, only: [:show, :edit, :update, :destroy]

  # GET /units_of_measures
  # GET /units_of_measures.json
  def index
    @units_of_measures = UnitsOfMeasure.all
  end

  # GET /units_of_measures/1
  # GET /units_of_measures/1.json
  def show
  end

  # GET /units_of_measures/new
  def new
    @units_of_measure = UnitsOfMeasure.new
  end

  # GET /units_of_measures/1/edit
  def edit
  end

  # POST /units_of_measures
  # POST /units_of_measures.json
  def create
    @units_of_measure = UnitsOfMeasure.new(units_of_measure_params)
    @units_of_measure.user_id = current_user.id
    @units_of_measure.measure_type_id = MeasureType.where('description = ?', measure_type_params[:measure_type_description]).first.id

    respond_to do |format|
      if @units_of_measure.save
        format.html { redirect_to @units_of_measure, notice: 'Units of measure was successfully created.' }
        format.json { render action: 'show', status: :created, location: @units_of_measure }
      else
        format.html { render action: 'new' }
        format.json { render json: @units_of_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /units_of_measures/1
  # PATCH/PUT /units_of_measures/1.json
  def update
    @units_of_measure.measure_type_id = MeasureType.where('description = ?', measure_type_params[:measure_type_description]).first.id
    @units_of_measure.user_id = current_user.id
    respond_to do |format|
      if @units_of_measure.update(units_of_measure_params)
        format.html { redirect_to @units_of_measure, notice: 'Units of measure was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @units_of_measure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /units_of_measures/1
  # DELETE /units_of_measures/1.json
  def destroy
    @units_of_measure.destroy
    respond_to do |format|
      format.html { redirect_to units_of_measures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_units_of_measure
      @units_of_measure = UnitsOfMeasure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def units_of_measure_params
      params.require(:units_of_measure).permit(:user_id, :description, :measure_type_id)
    end

    def measure_type_params
      params.require(:units_of_measure).permit(:measure_type_description)
    end
end
