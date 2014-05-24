class ProcessingUnitsController < ApplicationController
  before_action :set_processing_unit, only: [:show, :edit, :update, :destroy]

  # GET /processing_units
  # GET /processing_units.json
  def index
    @processing_units = ProcessingUnit.search(params[:search])
    # @processing_units = ProcessingUnit.all
  end

  # GET /processing_units/1
  # GET /processing_units/1.json
  def show
  end

  # GET /processing_units/new
  def new
    @processing_unit = ProcessingUnit.new
  end

  # GET /processing_units/1/edit
  def edit
  end

  # POST /processing_units
  # POST /processing_units.json
  def create

    @processing_unit = ProcessingUnit.new(processing_unit_params)
    @processing_unit.user_id = current_user.id
    geoarray = Geocoder.search(@processing_unit.reverse_geocode)
    @processing_unit.city = geoarray[0].city
    @processing_unit.state = geoarray[0].state
    @processing_unit.country = geoarray[0].country
    @processing_unit.unit_type_id = UnitType.where("description = ?", unit_type_params[:unit_type_desc]).first.id

    respond_to do |format|
      if @processing_unit.save
        format.html { redirect_to @processing_unit, notice: 'Processing unit was successfully created.' }
        format.json { render action: 'show', status: :created, location: @processing_unit }
        # This section adds in the name we're giving to the processing unit into the names table as a distinct entry.
        if name_params[:initial_name]
          @name = Name.new
          @name.name = name_params[:initial_name]
          @name.user_id = current_user.id
          @name.active_date = Time.now
          @name.nameable_id = @processing_unit.id
          @name.nameable_type = "ProcessingUnit"
          @name.save
        end
        @role_assignment = RoleAssignment.new
        @role_assignment.role_id = Role.where('role = ?', 'Operator').first.id
        @role_assignment.holder_id = Name.where("nameable_type = ? AND name = ?", 'Organization', role_assignment_params[:organization_id]).first.nameable_id
        @role_assignment.holder_type = "Organization"
        @role_assignment.subject_id = @processing_unit.id
        @role_assignment.subject_type = "ProcessingUnit"
        @role_assignment.active_date = Date.today
        @role_assignment.user_id = current_user.id
        @role_assignment.share = '1' 
        @role_assignment.save  
      else
        format.html { render action: 'new' }
        format.json { render json: @processing_unit.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /processing_units/1
  # PATCH/PUT /processing_units/1.json
  def update
    @processing_unit.user_id = current_user.id
    geoarray = Geocoder.search(@processing_unit.reverse_geocode)
    @processing_unit.city = geoarray[0].city
    @processing_unit.state = geoarray[0].state
    @processing_unit.country = geoarray[0].country
    respond_to do |format|
      if @processing_unit.update(processing_unit_params)
        format.html { redirect_to @processing_unit, notice: 'Processing unit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @processing_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /processing_units/1
  # DELETE /processing_units/1.json
  def destroy
    @processing_unit.destroy
    respond_to do |format|
      format.html { redirect_to processing_units_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_processing_unit
      @processing_unit = ProcessingUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def processing_unit_params
      params.require(:processing_unit).permit(:latitude, :longitude, :address, :user_id)
    end

    def name_params
      params.require(:processing_unit).permit(:initial_name)
    end

    def role_assignment_params
      params.require(:processing_unit).permit(:organization_id)
    end

    def unit_type_params
      params.require(:processing_unit).permit(:unit_type_desc)
    end

    # def search_params
    #   params.require(:processing_unit).permit(:search)
    # end
end
