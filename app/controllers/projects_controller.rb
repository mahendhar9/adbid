class ProjectsController < ApplicationController
  before_action :find_project, only: [:edit, :update, :show, :destroy]
  def index
    @projects = Project.all
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def show
    @donation = current_user.donations.new
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:title, :image_url, :short_description, :description,
      :goal, :status, :ends_on)     
  end

  def find_project
    @project = Project.find(params[:id])
    
  end
end
