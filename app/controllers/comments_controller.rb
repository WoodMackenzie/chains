class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @comment.commentable_id = params[:commentable_id]
    @comment.commentable_type = params[:commentable_type]
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
        @role_assignment = RoleAssignment.new
        @role_assignment.role_id = Role.where('role = ?', 'Information Source').first.id
        @role_assignment.holder_id = Name.where("nameable_type = ? AND name = ?", 'Organization', role_assignment_params[:organization_id]).first.nameable_id
        @role_assignment.holder_type = "Organization"
        @role_assignment.subject_id = @comment.id
        @role_assignment.subject_type = "Comment"
        @role_assignment.active_date = @comment.active_date
        @role_assignment.user_id = current_user.id
        @role_assignment.share = '1' 
        @role_assignment.save  
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :commentable_id, :commentable_type, :comment, :active_date)
    end

    def role_assignment_params
      params.require(:comment).permit(:organization_id)
    end

    def organization_id
      params[:organization_id]
    end
end