class ProjectDetailStringsController < ApplicationController
  before_action :set_project_detail_string, only: [:show, :edit, :update, :destroy]

  # GET /project_detail_strings
  # GET /project_detail_strings.json
  def index
    @project_detail_strings = ProjectDetailString.all
  end

  # GET /project_detail_strings/1
  # GET /project_detail_strings/1.json
  def show
  end

  # GET /project_detail_strings/new
  def new
    @project_detail_string = ProjectDetailString.new(:project_id => params[:project_id], :project_category_id => params[:project_category_id])
  end

  # GET /project_detail_strings/1/edit
  def edit
  end

  # POST /project_detail_strings
  # POST /project_detail_strings.json
  def create
    @project_detail_string = ProjectDetailString.new(project_detail_string_params)

    respond_to do |format|
      if @project_detail_string.save
        format.html { redirect_to @project_detail_string, notice: 'Project detail string was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project_detail_string }
      else
        format.html { render action: 'new' }
        format.json { render json: @project_detail_string.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_detail_strings/1
  # PATCH/PUT /project_detail_strings/1.json
  def update
    respond_to do |format|
      if @project_detail_string.update(project_detail_string_params)
        format.html { redirect_to @project_detail_string, notice: 'Project detail string was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project_detail_string.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_detail_strings/1
  # DELETE /project_detail_strings/1.json
  def destroy
    @project_detail_string.destroy
    respond_to do |format|
      format.html { redirect_to project_detail_strings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_detail_string
      @project_detail_string = ProjectDetailString.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_detail_string_params
      params.require(:project_detail_string).permit(:user_id, :project_id, :project_category_id, :value)
    end
end
