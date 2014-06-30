class ProjectDetailDatesController < ApplicationController
  before_action :set_project_detail_date, only: [:show, :edit, :update, :destroy]

  # GET /project_detail_dates
  # GET /project_detail_dates.json
  def index
    @project_detail_dates = ProjectDetailDate.all
  end

  # GET /project_detail_dates/1
  # GET /project_detail_dates/1.json
  def show
  end

  # GET /project_detail_dates/new
  def new
    @project_detail_date = ProjectDetailDate.new(:project_id => params[:project_id], :project_category_id => params[:project_category_id])
  end

  # GET /project_detail_dates/1/edit
  def edit
  end

  # POST /project_detail_dates
  # POST /project_detail_dates.json
  def create
    @project_detail_date = ProjectDetailDate.new(project_detail_date_params)

    respond_to do |format|
      if @project_detail_date.save
        format.html { redirect_to @project_detail_date, notice: 'Project detail date was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_detail_date }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_detail_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_detail_dates/1
  # PATCH/PUT /project_detail_dates/1.json
  def update
    respond_to do |format|
      if @project_detail_date.update(project_detail_date_params)
        format.html { redirect_to @project_detail_date, notice: 'Project detail date was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_detail_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_detail_dates/1
  # DELETE /project_detail_dates/1.json
  def destroy
    @project_detail_date.destroy
    respond_to do |format|
      format.html { redirect_to project_detail_dates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_detail_date
      @project_detail_date = ProjectDetailDate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_detail_date_params
      params.require(:project_detail_date).permit(:user_id, :project_id, :project_category_id, :value)
    end

end
