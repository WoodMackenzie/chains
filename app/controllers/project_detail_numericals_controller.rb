class ProjectDetailNumericalsController < ApplicationController
  before_action :set_project_detail_numerical, only: [:show, :edit, :update, :destroy]

  # GET /project_detail_numericals
  # GET /project_detail_numericals.json
  def index
    @project_detail_numericals = ProjectDetailNumerical.all
  end

  # GET /project_detail_numericals/1
  # GET /project_detail_numericals/1.json
  def show
  end

  # GET /project_detail_numericals/new
  def new
    @project_detail_numerical = ProjectDetailNumerical.new
  end

  # GET /project_detail_numericals/1/edit
  def edit
  end

  # POST /project_detail_numericals
  # POST /project_detail_numericals.json
  def create
    @project_detail_numerical = ProjectDetailNumerical.new(project_detail_numerical_params)

    respond_to do |format|
      if @project_detail_numerical.save
        format.html { redirect_to @project_detail_numerical, notice: 'Project detail numerical was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_detail_numerical }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_detail_numerical.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_detail_numericals/1
  # PATCH/PUT /project_detail_numericals/1.json
  def update
    respond_to do |format|
      if @project_detail_numerical.update(project_detail_numerical_params)
        format.html { redirect_to @project_detail_numerical, notice: 'Project detail numerical was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_detail_numerical.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_detail_numericals/1
  # DELETE /project_detail_numericals/1.json
  def destroy
    @project_detail_numerical.destroy
    respond_to do |format|
      format.html { redirect_to project_detail_numericals_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_detail_numerical
      @project_detail_numerical = ProjectDetailNumerical.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_detail_numerical_params
      params.require(:project_detail_numerical).permit(:user_id, :project_id, :project_category_id, :value, :units_of_measrure_id)
    end
end
