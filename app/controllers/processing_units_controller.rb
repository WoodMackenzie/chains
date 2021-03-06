class ProcessingUnitsController < ApplicationController
  before_action :set_processing_unit, only: [:show, :edit, :update, :destroy]

  # GET /processing_units
  # GET /processing_units.json
  def index
    # In this particular case, the search function returns an array object, but Kaminari requires 
    # an ActiveRecord::Relation object to function.  This checks to see if the search went through 
    # and applies the pagination in either instance.
    @processing_units = ProcessingUnit.search(params[:search])
    if @processing_units.class == Array
      @processing_units = Kaminari.paginate_array(@processing_units).page(params[:page]).per(5)
    else
      @processing_units = @processing_units.page(params[:page]).per(5)
    end
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
    if params[:granularity] == "coordinates"
      geoarray = Geocoder.search(@processing_unit.reverse_geocode)
      @processing_unit.city = geoarray[0].city
      @processing_unit.state = geoarray[0].state
      @processing_unit.country = geoarray[0].country
    else
      @processing_unit.city = nil
      @processing_unit.state = nil
      @processing_unit.country = nil
      temp_string = location_params[:country_variable]
      if location_params[:state_variable] != nil and location_params[:state_variable] != ""
        temp_string = [location_params[:state_variable], temp_string].compact.join(', ')
      end
      if location_params[:city_variable] != nil and location_params[:city_variable] != ""
        temp_string = [location_params[:city_variable], temp_string].compact.join(', ')
      end
      @processing_unit.address = temp_string
      geoarray = Geocoder.search(@processing_unit.geocode)
      @processing_unit.latitude = nil
      @processing_unit.longitude = nil
      @processing_unit.address = nil
      if params[:granularity] == "city"
        @processing_unit.city = geoarray[0].city
        @processing_unit.state = geoarray[0].state
        @processing_unit.country = geoarray[0].country
      elsif params[:granularity] == "state"
        @processing_unit.state = geoarray[0].state
        @processing_unit.country = geoarray[0].country
      elsif params[:granularity] == "country"
        @processing_unit.country = geoarray[0].country
      end
    end
    @processing_unit.location_granularity_id = LocationGranularity.where('description = ?', params[:granularity]).first.id
    @processing_unit.unit_type_id = UnitType.unit_type_list.index(unit_type_params[:unit_type_description])

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
    if params[:granularity] == "coordinates"
      geoarray = Geocoder.search(@processing_unit.reverse_geocode)
      @processing_unit.city = geoarray[0].city
      @processing_unit.state = geoarray[0].state
      @processing_unit.country = geoarray[0].country
    else
      @processing_unit.city = nil
      @processing_unit.state = nil
      @processing_unit.country = nil
      temp_string = location_params[:country_variable]
      if location_params[:state_variable] != nil and location_params[:state_variable] != ""
        temp_string = [location_params[:state_variable], temp_string].compact.join(', ')
      end
      if location_params[:city_variable] != nil and location_params[:city_variable] != ""
        temp_string = [location_params[:city_variable], temp_string].compact.join(', ')
      end
      @processing_unit.address = temp_string
      geoarray = Geocoder.search(@processing_unit.geocode)
      @processing_unit.latitude = nil
      @processing_unit.longitude = nil
      @processing_unit.address = nil
      if params[:granularity] == "city"
        @processing_unit.city = geoarray[0].city
        @processing_unit.state = geoarray[0].state
        @processing_unit.country = geoarray[0].country
      elsif params[:granularity] == "state"
        @processing_unit.state = geoarray[0].state
        @processing_unit.country = geoarray[0].country
      elsif params[:granularity] == "country"
        @processing_unit.country = geoarray[0].country
      end
    end
    @processing_unit.location_granularity_id = LocationGranularity.where('description = ?', params[:granularity]).first.id
    @processing_unit.unit_type_id = UnitType.unit_type_list.index(unit_type_params[:unit_type_description])
    respond_to do |format|
      if @processing_unit.update(processing_unit_params)
        format.html { redirect_to @processing_unit, notice: 'Processing unit was successfully updated.' }
        format.json { head :no_content }
        if name_params[:initial_name]
          @name = Name.where("nameable_id = ? AND nameable_type = ?", @processing_unit.id, "ProcessingUnit").last
          @name.name = name_params[:initial_name]
          @name.user_id = current_user.id
          @name.active_date = Time.now
          @name.nameable_id = @processing_unit.id
          @name.nameable_type = "ProcessingUnit"
          @name.save
        end
        @role_assignment = RoleAssignment.where("subject_id = ? AND subject_type = ?", @processing_unit.id, "ProcessingUnit").last
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
      params.require(:processing_unit).permit(:granularity, :latitude, :longitude, :address, :user_id)
    end

    def name_params
      params.require(:processing_unit).permit(:initial_name)
    end

    def role_assignment_params
      params.require(:processing_unit).permit(:organization_id)
    end

    def unit_type_params
      params.require(:processing_unit).permit(:unit_type_description)
    end

    def location_params
      params.require(:processing_unit).permit(:city_variable, :state_variable, :country_variable)
    end

    # def granularity_params
    #   params.require(:processing_unit).permit(:granularity)
    # end

    # def search_params
    #   params.require(:processing_unit).permit(:search)
    # end
end
