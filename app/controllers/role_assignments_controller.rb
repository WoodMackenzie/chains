class RoleAssignmentsController < ApplicationController
  before_action :set_role_assignment, only: [:show, :edit, :update, :destroy]

  # GET /role_assignments
  # GET /role_assignments.json
  def index
    @role_assignments = RoleAssignment.all
  end

  # GET /role_assignments/1
  # GET /role_assignments/1.json
  def show
  end

  # GET /role_assignments/new
  def new
    @role_assignment = RoleAssignment.new
  end

  # GET /role_assignments/1/edit
  def edit
  end

  # POST /role_assignments
  # POST /role_assignments.json
  def create
    @role_assignment = RoleAssignment.new(role_assignment_params)

    respond_to do |format|
      if @role_assignment.save
        format.html { redirect_to @role_assignment, notice: 'Role assignment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @role_assignment }
      else
        format.html { render action: 'new' }
        format.json { render json: @role_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /role_assignments/1
  # PATCH/PUT /role_assignments/1.json
  def update
    respond_to do |format|
      if @role_assignment.update(role_assignment_params)
        format.html { redirect_to @role_assignment, notice: 'Role assignment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @role_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_assignments/1
  # DELETE /role_assignments/1.json
  def destroy
    @role_assignment.destroy
    respond_to do |format|
      format.html { redirect_to role_assignments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role_assignment
      @role_assignment = RoleAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_assignment_params
      params[:role_assignment]
    end
end
