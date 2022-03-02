class ProposalsController < ApplicationController

  def new
    @proposal= Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.creator = current_user
    if @proposal.save
      redirect_to @proposal_path(@proposal.id), notice: 'Proposal was successfully created.'
    else
      render :new
    end
  end

  def update
    if @proposal.update(proposal_params)
      redirect_to @proposal_path(@character)
    else
      render :edit
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
    @proposal = Proposal.new
  end


  def archive

  end

  def reject
    @proposal = Proposal.find(params[:id])
    @proposal.status = "rejected"
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :description, :status)
  end
end
