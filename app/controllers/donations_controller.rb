class DonationsController < ApplicationController
  before_action :find_project
  def new
    @donation = current_user.donations.new
  end

  def create
    @donation = current_user.donations.new
    @donation.project_id = @project.id
    @donation.amount = params[:donation][:amount]
    @project.amount_raised += @donation.amount
    @project.amount_needed = @project.goal - @project.amount_raised
    @project.save
    if @donation.save
      redirect_to @project
    else
      render 'new'
    end
  end

  private
  def find_project
    @project = Project.find(params[:project_id])
  end
end
