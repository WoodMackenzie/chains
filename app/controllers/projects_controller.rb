class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all.page(params[:page])
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
    @project.projectable_type = params[:projectable_type]
    @project.projectable_id = params[:projectable_id]
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    respond_to do |format|
      if @project.save
        # if we end up saving this project, we need to add the project details we're specifying in the creation step here
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
        @project_detail_string_1 = ProjectDetailString.new
        @project_detail_string_1.user_id = current_user.id
        @project_detail_string_1.project_id = @project.id
        @project_detail_string_1.project_category_id = ProjectCategory.where("description = ?", project_detail_params[:project_type_variable]).first.parent_id
        @project_detail_string_1.value = project_detail_params[:project_type_variable]
        @project_detail_string_1.save
        @project_detail_string_2 = ProjectDetailString.new
        @project_detail_string_2.user_id = current_user.id
        @project_detail_string_2.project_id = @project.id
        @project_detail_string_2.project_category_id = ProjectCategory.where("description = ?", project_detail_params[:project_status_variable]).first.parent_id
        @project_detail_string_2.value = project_detail_params[:project_status_variable]
        @project_detail_string_2.save
        @project_detail_string_3 = ProjectDetailString.new
        @project_detail_string_3.user_id = current_user.id
        @project_detail_string_3.project_id = @project.id
        @project_detail_string_3.project_category_id = ProjectCategory.where("description = ?", project_detail_params[:investment_probability_variable]).first.parent_id
        @project_detail_string_3.value = project_detail_params[:investment_probability_variable]
        @project_detail_string_3.save
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    @project.user_id = current_user.id
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
        project_category_1 = ProjectCategory.find(ProjectCategory.where("description = ?", project_detail_params[:project_type_variable]).first.parent_id)
        @project_detail_string_1 = ProjectDetailString.where("project_id = ? AND project_category_id = ?", @project.id, project_category_1.id)
        @project_detail_string_1.user_id = current_user.id
        @project_detail_string_1.project_id = @project.id
        @project_detail_string_1.project_category_id = project_category_1.id
        @project_detail_string_1.value = project_detail_params[:project_type_variable]
        @project_detail_string_1.save
        project_category_2 = ProjectCategory.find(ProjectCategory.where("description = ?", project_detail_params[:project_status_variable]).first.parent_id)
        @project_detail_string_2 = ProjectDetailString.where("project_id = ? AND project_category_id = ?", @project.id, project_category_2.id)
        @project_detail_string_2.user_id = current_user.id
        @project_detail_string_2.project_id = @project.id
        @project_detail_string_2.project_category_id = project_category_2.id
        @project_detail_string_2.value = project_detail_params[:project_status_variable]
        @project_detail_string_2.save
        project_category_3 = ProjectCategory.find(ProjectCategory.where("description = ?", project_detail_params[:investment_probability_variable]).first.parent_id)
        @project_detail_string_3 = ProjectDetailString.where("project_id = ? AND project_category_id = ?", @project.id, project_category_3.id)
        @project_detail_string_3.user_id = current_user.id
        @project_detail_string_3.project_id = @project.id
        @project_detail_string_3.project_category_id = project_category_3.id
        @project_detail_string_3.value = project_detail_params[:investment_probability_variable]
        @project_detail_string_3.save
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:user_id, :projectable_type, :projectable_id)
    end

    def project_detail_params
      params.require(:project).permit(:project_type_variable, :project_status_variable, :investment_probability_variable)
    end
end
