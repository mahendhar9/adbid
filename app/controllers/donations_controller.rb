class DonationsController < ApplicationController
  before_action :find_project
  before_action :check_if_complete, only: [:create]

  def new
    @donation = current_user.donations.new
  end

  def create
    if !(@project.amount_raised == @project.goal)
      @donation = current_user.donations.new(donation_params)
      @donation.project_id = @project.id
      @donation.amount = params[:donation][:amount]
      @project.amount_raised += @donation.amount
      @project.amount_needed = @project.goal - @project.amount_raised
      @project.save
      if @donation.save
        flash[:notice] = "Thank you for making a difference."
        redirect_to @project and return
      else
        flash[:alert] = "Sorry, there was a problem."
      end
    end
    redirect_to @project
  end

  private
  def find_project
    @project = Project.find(params[:project_id])
  end

  def donation_params
    params.require(:donation).permit(:amount)
  end

  def check_if_complete
    if @project.amount_raised == @project.goal
      flash[:alert] = "Thank you, but this project has already been funded."
    end
  end


end
